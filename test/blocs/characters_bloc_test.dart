import 'package:alx_technical_test/blocs/characters_bloc.dart';
import 'package:alx_technical_test/blocs/characters_bloc_events.dart';
import 'package:alx_technical_test/blocs/characters_bloc_states.dart';
import 'package:alx_technical_test/data/models/character.dart';
import 'package:alx_technical_test/data/repositories/character_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'characters_bloc_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  group('CharactersBloc', () {
    late MockCharacterRepository mockRepository;
    late CharactersBloc charactersBloc;

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      mockRepository = MockCharacterRepository();
      charactersBloc = CharactersBloc(repository: mockRepository);
    });

    tearDown(() {
      charactersBloc.close();
    });

    test('initial state is InitialState', () {
      expect(charactersBloc.state, InitialState());
    });

    final characters = [
      Character(id: 1, name: 'Bob'),
      Character(id: 2, name: 'Linda'),
      Character(id: 3, name: 'Tina'),
      Character(id: 4, name: 'Gene'),
    ];

    blocTest<CharactersBloc, CharactersBlocState>(
      'emits [LoadedState] when FetchData event is added',
      build: () {
        when(mockRepository.getData(1)).thenAnswer((_) async => characters.sublist(0, 2));
        return charactersBloc;
      },
      act: (bloc) => bloc.add(FetchData()),
      expect: () => [LoadedState(data: characters.sublist(0, 2), hasReachedMax: false)],
    );

    blocTest<CharactersBloc, CharactersBlocState>(
      'emits LoadedState when LoadNextPage event is added',
      build: () {
        charactersBloc.characters.addAll(characters.sublist(0, 2));
        when(mockRepository.getData(2)).thenAnswer((_) async => characters.sublist(2, 4));
        return charactersBloc;
      },
      act: (bloc) => bloc.add(LoadNextPage()),
      expect: () => [LoadedState(data: characters, hasReachedMax: false)],
    );

    blocTest<CharactersBloc, CharactersBlocState>(
      'emits [ErrorState] when LoadNextPage event is added and data retrieval fails',
      seed: () => LoadedState(data: characters.sublist(0, 2), hasReachedMax: false),
      build: () {
        when(mockRepository.getData(2)).thenThrow(Exception('Failed to retrieve data'));
        return charactersBloc;
      },
      act: (bloc) => bloc.add(LoadNextPage()),
      expect: () => [const ErrorState(message: 'Exception: Failed to retrieve data')],
    );
  });
}
