import 'package:alx_technical_test/data/models/character.dart';
import 'package:alx_technical_test/data/repositories/character_repository.dart';
import 'package:alx_technical_test/data/repositories/local_data_source.dart';
import 'package:alx_technical_test/data/repositories/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  group('CharacterRepository', () {
    late RemoteDataSource remoteDataSource;
    late LocalDataSource localDataSource;
    late CharacterRepository repository;

    setUp(() {
      remoteDataSource = MockRemoteDataSource();
      localDataSource = MockLocalDataSource();
      repository = CharacterRepository(remoteDataSource, localDataSource);
    });

    group('getData', () {
      const page = 1;
      final characters = List.generate(
        10,
        (index) => Character(id: index, name: 'name$index'),
      );

      test('should return cached data when available', () async {
        // Arrange
        final cachedData = characters.sublist(0, 2);
        when(localDataSource.getList(page.toString(), Character.fromJson)).thenAnswer((_) async => cachedData);

        // Act
        final result = await repository.getData(page);

        // Assert
        verify(localDataSource.getList(page.toString(), Character.fromJson));
        verifyNoMoreInteractions(remoteDataSource);
        expect(result, cachedData);
      });

      test('should return remote data when there is no cached data', () async {
        // Arrange
        when(localDataSource.getList(page.toString(), Character.fromJson)).thenAnswer((_) async => []);
        when(remoteDataSource.getCharacters(page)).thenAnswer((_) async => characters);

        // Act
        final result = await repository.getData(page);

        // Assert
        verify(localDataSource.getList(page.toString(), Character.fromJson));
        verify(remoteDataSource.getCharacters(page));
        verify(localDataSource.setList(page.toString(), characters, Character.toJson));
        expect(result, characters);
      });

      test('should throw an exception when both remote and local data sources fail', () async {
        // Arrange
        when(localDataSource.getList(page.toString(), Character.fromJson)).thenThrow(Exception());
        when(remoteDataSource.getCharacters(page)).thenThrow(Exception());

        // Act
        final call = repository.getData;

        // Assert
        expect(() => call(page), throwsA(isA<Exception>()));
      });
    });
  });
}
