import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

class LinkedLocationCharactersAPI {
  Dio dio = getIt.get<Dio>(instanceName: 'Empty');

  Future<List<Character>> getLocationCharacters(
      List<String> charactersURLs) async {
    try {
      List<Future> futures = [];

      for (int i = 0; i < charactersURLs.length; i++) {
        futures.add(dio.get(charactersURLs[i]));
      }

      final results = await Future.wait(futures);

      List<Character> locationCharacters = [];

      for (int i = 0; i < results.length; i++) {
        locationCharacters.add(Character.fromJson(results[i].data));
      }

      return locationCharacters;
    }   
     catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      rethrow;
    }
  }
}
