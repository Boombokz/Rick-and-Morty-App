import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/network_service/network_service.dart';

part 'characters_list_event.dart';

part 'characters_list_state.dart';

class CharactersListBloc extends Bloc<CharactersListEvent, CharactersListState> {
  CharactersListBloc() : super(CharactersListLoadingState());

  NetworkService networkService = NetworkService();

  @override
  Stream<CharactersListState> mapEventToState(
    CharactersListEvent event,
  ) async* {
    if (event is CharactersListLoadEvent) {
      yield CharactersListLoadingState();
      try {
        List<Character> loadedCharacters = await networkService.getCharacters();

        yield CharactersListLoadedState(loadedCharacters: loadedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield CharactersListLoadErrorState();
      }
    }

  }
}
