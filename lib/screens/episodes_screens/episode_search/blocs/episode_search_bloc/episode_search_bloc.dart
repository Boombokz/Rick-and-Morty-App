import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/network_service/episodes_network_service.dart';

part 'episode_search_event.dart';

part 'episode_search_state.dart';

class EpisodeSearchBloc extends Bloc<EpisodeSearchEvent, EpisodeSearchState> {
  EpisodeSearchBloc() : super(EpisodeSearchInitial());
  int page = 1;
  bool isFetching = false;
  bool isFirstTime = false;

  EpisodesNetworkService episodesNetworkService = EpisodesNetworkService();

  @override
  Stream<EpisodeSearchState> mapEventToState(
    EpisodeSearchEvent event,
  ) async* {
    if (event is EpisodeSearchStartEvent) {
      yield EpisodeSearchLoadingState();
      if (isFirstTime == true) {
        page = 1;
      }

      try {
        List<Episode> searchedEpisodes = [];
        int pages = await episodesNetworkService
            .getEpisodesSearchPagesCount(event.text);

        if (page <= pages) {
          searchedEpisodes =
              await episodesNetworkService.searchEpisodes(event.text, page);
        }
        yield EpisodeSearchedState(searchedEpisodes: searchedEpisodes);
        page++;
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield EpisodeSearchErrorState();
      }
    }

    if (event is EpisodeSearchInitialEvent) {
      yield EpisodeSearchInitial();
    }
  }
}
