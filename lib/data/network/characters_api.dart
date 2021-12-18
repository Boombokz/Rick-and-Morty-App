import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

class CharactersApi {
  Dio dio = getIt.get<Dio>(instanceName: 'Base');

  Future<List<Character>> getCharacters(int i) async {
    try {
      Response response = await dio.get('character/?page=$i');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => Character.fromJson(e))
            .toList();
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  Future<int> getTotalCharactersCount() async {
    try {
      Response response = await dio.get('character/');
      if (response.statusCode == 200) {
        return response.data['info']['count'];
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  Future<int> getCharacterTotalPagesCount() async {
    try {
      Response response = await dio.get('character/');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  Future<List<Character>> searchCharacters(String text, int i) async {
    try {
      Response response = await dio.get('character/?page=$i&name=$text');

      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => Character.fromJson(e))
            .toList();
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }


  Future<int> getCharacterSearchPagesCount(String name) async {
    try {
      Response response = await dio.get('character/?name=$name');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }
}