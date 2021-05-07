import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/network_service/characters_network_service.dart';

part 'character_search_event.dart';

part 'character_search_state.dart';

class CharacterSearchBloc
    extends Bloc<CharacterSearchEvent, CharacterSearchState> {
  CharacterSearchBloc() : super(CharacterSearchInitial());

  CharactersNetworkService networkService = CharactersNetworkService();

  @override
  Stream<CharacterSearchState> mapEventToState(
    CharacterSearchEvent event,
  ) async* {
    if (event is CharacterSearchStartEvent) {
      yield CharacterSearchLoadingState();
      try {
        List<Character> searchedCharacters =
            await networkService.searchCharacters(event.text);

        yield CharacterSearchedState(searchedCharacters: searchedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharacterSearchErrorState();
      }
    }
    if (event is CharacterSearchInitialEvent) {
      yield CharacterSearchInitial();

    }
  }
}
