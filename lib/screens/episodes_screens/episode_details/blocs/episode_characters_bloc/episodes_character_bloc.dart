import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/network_service/linked_episode_characters.dart';

part 'episodes_character_event.dart';

part 'episodes_character_state.dart';

class EpisodesCharacterBloc
    extends Bloc<EpisodesCharacterEvent, EpisodesCharacterState> {
  EpisodesCharacterBloc() : super(EpisodesCharacterInitial());

  LinkedEpisodeCharactersService linkedEpisodeCharactersService =
      LinkedEpisodeCharactersService();

  @override
  Stream<EpisodesCharacterState> mapEventToState(
    EpisodesCharacterEvent event,
  ) async* {
    if (event is EpisodesCharacterLoadEvent) {
      yield EpisodesCharacterLoadingState();
      try {
        List<Character> loadedCharacters = await linkedEpisodeCharactersService
            .getEpisodeCharacters(event.linkedCharactersURLs);

        yield EpisodesCharacterLoadedState(linkedCharacters: loadedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield EpisodesCharacterErrorState();
      }
    }
  }
}
