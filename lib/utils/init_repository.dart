import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/character_repository.dart';
import '../data/repositories/local_data_source.dart';
import '../data/repositories/remote_data_source.dart';

Future<CharactersRepository> initRepository() async {
  final httpClientInstance = Dio();
  final localStorageClientInstance = await SharedPreferences.getInstance();

  return CharactersRepository(
    RemoteDataSource(httpClient: httpClientInstance),
    LocalDataSource(localStorageClient: localStorageClientInstance),
  );
}
