import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/constants/network/network_url.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';

class EpisodesNetworkService {
  Dio dio = Dio(BaseOptions(baseUrl: NetworkURL.baseURL));

  Future<List<Episode>> getEpisodes(int pages) async {
    try {
      List<Episode> loadedEpisodes = [];
      for (int i = 1; i <= pages; i++) {
        Response response = await dio.get('episode/?page=$i');
        if (response.statusCode == 200) {
          loadedEpisodes.addAll((response.data['results'] as List)
              .map((e) => Episode.fromJson(e))
              .toList());
        } else {
          throw Exception();
        }
      }
      return loadedEpisodes;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getEpisodesTotalPagesCount() async {
    try {
      Response response = await dio.get('episode/');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<List<Episode>> searchEpisodes(String text, int i) async {
    try {
      Response response = await dio.get('episode/?page=$i&name=$text');

      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => Episode.fromJson(e))
            .toList();
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getEpisodesSearchPagesCount(String name) async {
    try {
      Response response = await dio.get('episode/?name=$name');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
