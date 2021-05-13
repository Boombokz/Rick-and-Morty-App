import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';

class LinkedLocationCharactersAPI {
  Dio dio = Dio();

  Future<List<Character>> getLocationCharacters(List<String> charactersURLs) async {
    try {
      List<Character> locationCharacters = [];
      for (int i = 0; i < charactersURLs.length; i++) {
        Response response = await dio.get(charactersURLs[i]);
        if (response.statusCode == 200) {
          locationCharacters.add(Character.fromJson(response.data));
        } else {
          throw Exception();
        }
      }
      return locationCharacters;
    } on Exception catch (e) {
      throw e;
    }
  }
}