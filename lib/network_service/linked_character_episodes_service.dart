import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';

class LinkedCharacterEpisodesService {
  Dio dio = Dio();

  Future<List<Episode>> getCharacterEpisodes(List<String> episodesURLs) async {
    try {
      List<Episode> characterEpisodes = [];
      for (int i = 0; i < episodesURLs.length; i++) {
        Response response = await dio.get(episodesURLs[i]);
        if (response.statusCode == 200) {
          characterEpisodes.add(Episode.fromJson(response.data));
        } else {
          throw Exception();
        }
      }
      return characterEpisodes;
    } on Exception catch (e) {
      throw e;
    }
  }
}
