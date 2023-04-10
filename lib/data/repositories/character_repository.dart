import '../models/character.dart';
import 'local_data_source.dart';
import 'remote_data_source.dart';

class CharacterRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  CharacterRepository(this._remoteDataSource, this._localDataSource);

  Future<List<Character>> getData(int page) async {
    try {
      final cachedData = await _localDataSource.getList(page.toString(), Character.fromJson);

      if (cachedData.isNotEmpty) {
        return cachedData;
      }
      final characters = await _remoteDataSource.getCharacters(page);

      await _localDataSource.setList<Character>(page.toString(), characters, Character.toJson);

      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
