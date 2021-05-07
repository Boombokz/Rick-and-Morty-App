import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/network_service/episodes_load_service.dart';

part 'episodes_character_event.dart';

part 'episodes_character_state.dart';

class EpisodesCharacterBloc
    extends Bloc<EpisodesCharacterEvent, EpisodesCharacterState> {
  EpisodesCharacterBloc() : super(EpisodesCharacterLoadingState());

  EpisodesLoadService episodesLoadService = EpisodesLoadService();

  @override
  Stream<EpisodesCharacterState> mapEventToState(
    EpisodesCharacterEvent event,
  ) async* {
    if (event is EpisodesCharacterLoadEvent) {
      yield EpisodesCharacterLoadingState();
      try {
        List<Episode> loadedEpisodes =
            await episodesLoadService.getCharacterEpisodes(event.episodes);

        yield EpisodesCharacterLoadedState(episodes: loadedEpisodes);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield EpisodesCharacterErrorState();
      }
    }
  }
}
