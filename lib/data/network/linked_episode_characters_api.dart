import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';

class LinkedEpisodeCharactersAPI {
  Dio dio = Dio();

  Future<List<Character>> getEpisodeCharacters(
      List<String> charactersURLs) async {
    try {
      List<Character> episodeCharacters = [];
      for (int i = 0; i < charactersURLs.length; i++) {
        Response response = await dio.get(charactersURLs[i]);
        if (response.statusCode == 200) {
          episodeCharacters.add(Character.fromJson(response.data));
        } else {
          throw Exception();
        }
      }
      return episodeCharacters;
    } on Exception catch (e) {
      throw e;
    }
  }
}
