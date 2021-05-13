import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/network/characters_api.dart';

part 'characters_count_event.dart';

part 'characters_count_state.dart';

class CharactersCountBloc
    extends Bloc<CharactersCountEvent, CharactersCountState> {
  CharactersCountBloc() : super(CharactersCountLoadingState());

  CharactersApi charactersAPI = CharactersApi();

  @override
  Stream<CharactersCountState> mapEventToState(
    CharactersCountEvent event,
  ) async* {
    if (event is CharactersCountLoadEvent) {
      yield CharactersCountLoadingState();
      try {
        int totalCount = await charactersAPI.getTotalCharactersCount();
        yield CharactersCountLoadedState(totalCount: totalCount);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);

        yield CharacterCountErrorState();
      }
    }
  }
}
