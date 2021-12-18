import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/data/network/characters_api.dart';

part 'characters_list_event.dart';

part 'characters_list_state.dart';

class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  CharactersListBloc() : super(CharactersListLoadingState());
  int page = 1;
  bool isFetching = false;

  CharactersApi characterAPI = CharactersApi();

  @override
  Stream<CharactersListState> mapEventToState(
    CharactersListEvent event,
  ) async* {
    if (event is CharactersListLoadEvent) {
      yield CharactersListLoadingState();
      try {
        List<Character> loadedCharacters = [];
        int pages = await characterAPI.getCharacterTotalPagesCount();

        if (page <= pages) {
          loadedCharacters = await characterAPI.getCharacters(page);
        } else {
          loadedCharacters = [];
        }
        yield CharactersListLoadedState(loadedCharacters: loadedCharacters);
        page++;
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharactersListLoadErrorState();
      }
    }
  }
}
