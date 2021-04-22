import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/models/character_model.dart';

class NetworkService {
  Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  Future<List<Character>> getCharacters() async {
    Response response = await dio.get('?page=1');

    if (response.statusCode == 200) {

      return (response.data['results'] as List).map((e) => Character.fromJson(e)).toList();
    } else {
      print(response.statusCode);
      return [];
    }

  }
}
