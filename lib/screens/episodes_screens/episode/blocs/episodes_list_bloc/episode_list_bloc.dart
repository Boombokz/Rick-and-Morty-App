import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/network_service/episodes_network_service.dart';

part 'episode_list_event.dart';

part 'episode_list_state.dart';

class EpisodesListBloc extends Bloc<EpisodesListEvent, EpisodesListState> {
  EpisodesListBloc() : super(EpisodesListLoadingState());

  EpisodesNetworkService episodesNetworkService = EpisodesNetworkService();

  @override
  Stream<EpisodesListState> mapEventToState(
    EpisodesListEvent event,
  ) async* {
    if (event is EpisodesListLoadEvent) {
      yield EpisodesListLoadingState();
      try {
        int pages = await episodesNetworkService.getEpisodesTotalPagesCount();
        List<Episode> loadedEpisodes =
            await episodesNetworkService.getEpisodes(pages);

        yield EpisodesListLoadedState(loadedEpisodes: loadedEpisodes);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield EpisodesListLoadErrorState();
      }
    }
  }
}
