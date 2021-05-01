import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/models/character_model.dart';

class NetworkService {
  Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  Future<List<Character>> getCharacters() async {
    Response response = await dio.get('character/?page=1');
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }

  Future<Character> getCharacterDetails(int id) async {
    Response response = await dio.get('character/$id');
    if (response.statusCode == 200) {
      return Character.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
