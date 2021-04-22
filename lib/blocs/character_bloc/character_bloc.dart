import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/network_service/network_service.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterLoadingState());

  NetworkService networkService = NetworkService();

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is CharacterLoadEvent) {
      yield CharacterLoadingState();
      try{
        List<Character> loadedCharacters = await networkService.getCharacters();

        yield CharacterLoadedState(loadedCharacters: loadedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharacterLoadErrorState();
      }
    }
  }
}
