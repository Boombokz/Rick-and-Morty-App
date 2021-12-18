import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

class LinkedCharacterEpisodesAPI {
  Dio dio = getIt.get<Dio>(instanceName: 'Empty');

  Future<List<Episode>> getCharacterEpisodes(List<String> episodesURLs) async {
    try {
      List<Future> futures = [];

      for (int i = 0; i < episodesURLs.length; i++) {
        futures.add(dio.get(episodesURLs[i]));
      }

       final results = await Future.wait(futures);

      List<Episode> characterEpisodes = [];

      for (int i = 0; i < results.length; i++) {
        characterEpisodes.add(Episode.fromJson(results[i].data));
      }

      return characterEpisodes;
    } catch (e) {
      rethrow;
    }
  }
}
