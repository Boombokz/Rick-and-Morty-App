import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/network_service/linked_character_episodes_service.dart';

part 'character_episodes_event.dart';

part 'character_episodes_state.dart';

class CharactersEpisodeBloc
    extends Bloc<EpisodesCharacterEvent, EpisodesCharacterState> {
  CharactersEpisodeBloc() : super(EpisodesCharacterLoadingState());

  LinkedCharacterEpisodesService episodesLoadService = LinkedCharacterEpisodesService();

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
