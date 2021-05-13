import 'dart:async';

import 'package:bloc/bloc.dart';
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

  @override
  Stream<LocationsCharacterState> mapEventToState(
    LocationsCharacterEvent event,
  ) async* {
    if (event is LocationsCharacterLoadEvent) {
      yield LocationsCharacterLoadingState();
      try {
        List<Character> loadedCharacters = await linkedLocationCharactersAPI
            .getLocationCharacters(event.linkedCharactersURLs);

        yield LocationsCharacterLoadedState(linkedCharacters: loadedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LocationsCharacterErrorState();
      }
    }
  }
}
