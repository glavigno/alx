import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences localStorageClient;

  LocalDataSource({required this.localStorageClient});

  Future<List<T>> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final jsonString = localStorageClient.getString(key);

    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List;
      final list = jsonList.map((e) => fromJson(e as Map<String, dynamic>)).toList();

      return list.cast<T>();
    } else {
      return [];
    }
  }

  Future<void> setList<T>(String key, List<T> list, void Function(T) toJson) async {
    final jsonList = list.map((e) => toJson(e)).toList();
    final jsonString = jsonEncode(jsonList);
    await localStorageClient.setString(key, jsonString);
  }

  Future<bool> deleteCache() {
    return localStorageClient.clear();
  }
}
