import 'package:dio/dio.dart';

import '../models/character.dart';

class RemoteDataSource {
  late final Dio httpClient;

  RemoteDataSource({required this.httpClient});

  static const String _baseUrl = 'https://bobsburgers-api.herokuapp.com';
  static const String _charactersEndpoint = '/characters';

  Future<List<Character>> getCharacters(int page) async {
    final url = '$_baseUrl$_charactersEndpoint?skip=${page * 7}&limit=7';
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      final characters = (response.data as List).map((e) => Character.fromJson(e)).toList();

      return characters;
    } else {
      throw Exception('Failed to fetch characters');
    }
  }
}
