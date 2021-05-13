import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/data/network/characters_api.dart';

part 'character_search_event.dart';

part 'character_search_state.dart';

class CharacterSearchBloc
    extends Bloc<CharacterSearchEvent, CharacterSearchState> {
  CharacterSearchBloc() : super(CharacterSearchInitial());
  int page = 1;
  bool isFetching = false;
  bool isFirstTime = false;

  CharactersApi networkService = CharactersApi();

  @override
  Stream<CharacterSearchState> mapEventToState(
    CharacterSearchEvent event,
  ) async* {
    if (event is CharacterSearchStartEvent) {
      yield CharacterSearchLoadingState();
      if (isFirstTime == true) {
        page = 1;
      }

      try {
        List<Character> searchedCharacters = [];
        int pages =
            await networkService.getCharacterSearchPagesCount(event.text);

        if (page <= pages) {
          searchedCharacters =
              await networkService.searchCharacters(event.text, page);
        }
        yield CharacterSearchedState(searchedCharacters: searchedCharacters);
        page++;
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
