import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/network_service/network_service.dart';

part 'character_event.dart';

part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial());

  NetworkService networkService = NetworkService();

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is CharacterLoadEvent) {
      yield CharacterLoadingState();
      try {
        Character selectedCharacter =
            await networkService.getCharacterDetails(event.idCharacter);

        yield CharacterLoadedState(character: selectedCharacter);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharacterLoadErrorState();
      }
    }
  }
}
