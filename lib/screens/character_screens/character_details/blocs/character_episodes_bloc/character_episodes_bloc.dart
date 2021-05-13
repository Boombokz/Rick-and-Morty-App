import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/data/network/linked_character_episodes_api.dart';

part 'character_episodes_event.dart';

part 'character_episodes_state.dart';

class CharacterEpisodesBloc
    extends Bloc<CharacterEpisodesEvent, CharacterEpisodesState> {
  CharacterEpisodesBloc() : super(CharacterEpisodesLoadingState());

  LinkedCharacterEpisodesAPI linkedCharactersEpisodesAPI = LinkedCharacterEpisodesAPI();

  @override
  Stream<CharacterEpisodesState> mapEventToState(
      CharacterEpisodesEvent event,
  ) async* {
    if (event is CharacterEpisodesLoadEvent) {
      yield CharacterEpisodesLoadingState();
      try {
        List<Episode> loadedEpisodes =
            await linkedCharactersEpisodesAPI.getCharacterEpisodes(event.episodes);

        yield CharacterEpisodesLoadedState(episodes: loadedEpisodes);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharacterEpisodesErrorState();
      }
    }
  }
}
