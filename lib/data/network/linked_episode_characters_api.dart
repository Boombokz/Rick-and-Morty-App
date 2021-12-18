import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

class LinkedEpisodeCharactersAPI {
  Dio dio = getIt.get<Dio>(instanceName: 'Empty');

  Future<List<Character>> getEpisodeCharacters(
      List<String> charactersURLs) async {
    try {
       List<Future> futures = [];

      for (int i = 0; i < charactersURLs.length; i++) {
        futures.add(dio.get(charactersURLs[i]));
      }

      final results = await Future.wait(futures);

      List<Character> episodeCharacters = [];

      for (int i = 0; i < results.length; i++) {
        episodeCharacters.add(Character.fromJson(results[i].data));
      }

      return episodeCharacters;
    } on Exception {
      rethrow;
    }
  }
}
