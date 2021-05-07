import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/constants/network/network_url.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';

class CharactersNetworkService {
  Dio dio = Dio(BaseOptions(baseUrl: NetworkURL.baseURL));

  Future<List<Character>> getCharacters() async {
    try {
      List<Character> allCharacters = [];
      var pagesCount = await dio.get('character');
      if (pagesCount.statusCode == 200) {
        int count = pagesCount.data['info']['pages'];
        for (int i = 1; i <= count; i++) {
          Response response = await dio.get('character/?page=$i');
          if (response.statusCode == 200) {
            allCharacters.addAll((response.data['results'] as List)
                .map((e) => Character.fromJson(e))
                .toList());
          } else {
            throw Exception();
          }
        }
      }
      return allCharacters;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getTotalCharactersCount() async {
    try {
      Response response = await dio.get('character');
      if (response.statusCode == 200) {
        return response.data['info']['count'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Character> getCharacterDetails(int id) async {
    try {
      Response response = await dio.get('character/$id');
      if (response.statusCode == 200) {
        return Character.fromJson(response.data);
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<List<Character>> searchCharacters(String text) async {
    try {
      List<Character> searchedCharacters = [];

      Response response = await dio.get('character/?name=$text');

      if (response.statusCode == 200) {
        int count = response.data['info']['pages'];
        for (int i = 1; i <= count; i++) {
          Response response = await dio.get('character/?page=$i&name=$text');
          searchedCharacters.addAll((response.data['results'] as List)
              .map((e) => Character.fromJson(e))
              .toList());
        }
      } else {
        throw Exception();
      }
      return searchedCharacters;
    } on Exception catch (e) {
      throw e;
    }
  }
}
