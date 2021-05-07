import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/network_service/characters_network_service.dart';

part 'characters_count_event.dart';

part 'characters_count_state.dart';

class CharactersCountBloc
    extends Bloc<CharactersCountEvent, CharactersCountState> {
  CharactersCountBloc() : super(CharactersCountLoadingState());

  CharactersNetworkService networkService = CharactersNetworkService();

  @override
  Stream<CharactersCountState> mapEventToState(
    CharactersCountEvent event,
  ) async* {
    if (event is CharactersCountLoadEvent) {
      yield CharactersCountLoadingState();
      try {
        int totalCount = await networkService.getTotalCharactersCount();
        yield CharactersCountLoadedState(totalCount: totalCount);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);

        yield CharacterCountErrorState();
      }
    }
  }
}
