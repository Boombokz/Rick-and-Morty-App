import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/network_service/linked_location_characters_service.dart';

part 'locations_character_event.dart';

part 'locations_character_state.dart';

class LocationsCharacterBloc
    extends Bloc<LocationsCharacterEvent, LocationsCharacterState> {
  LocationsCharacterBloc() : super(LocationsCharacterInitial());

  LinkedLocationCharactersService linkedLocationCharactersService =
      LinkedLocationCharactersService();

  @override
  Stream<LocationsCharacterState> mapEventToState(
    LocationsCharacterEvent event,
  ) async* {
    if (event is LocationsCharacterLoadEvent) {
      yield LocationsCharacterLoadingState();
      try {
        List<Character> loadedCharacters = await linkedLocationCharactersService
            .getLocationCharacters(event.linkedCharactersURLs);

        yield LocationsCharacterLoadedState(linkedCharacters: loadedCharacters);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LocationsCharacterErrorState();
      }
    }
  }
}
