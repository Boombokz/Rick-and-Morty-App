import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/data/network/linked_location_characters_api.dart';

part 'locations_character_event.dart';

part 'locations_character_state.dart';

class LocationsCharacterBloc
    extends Bloc<LocationsCharacterEvent, LocationsCharacterState> {
  LocationsCharacterBloc() : super(LocationsCharacterInitial());

  LinkedLocationCharactersAPI linkedLocationCharactersAPI =
      LinkedLocationCharactersAPI();

  List<String> linkedCharacters = [];

  @override
  Stream<LocationsCharacterState> mapEventToState(
    LocationsCharacterEvent event,
  ) async* {
    if (event is LocationsCharacterResetEvent) {
      yield LocationsCharacterInitial();
    }
    if (event is LocationsCharacterLoadEvent) {
      yield LocationsCharacterLoadingState();

      try {
        List<Character> loadedCharacters = await linkedLocationCharactersAPI
            .getLocationCharacters(event.linkedCharactersURLs);
        linkedCharacters = event.linkedCharactersURLs;

        yield LocationsCharacterLoadedState(linkedCharacters: loadedCharacters);
      } on DioError catch (e) {
        if (e.response?.statusCode == 429) {
          add(LocationsCharacterLoadEvent(
              linkedCharactersURLs: linkedCharacters));
        }
      } catch (e) {
        yield LocationsCharacterErrorState();
      }
    }
  }
}
