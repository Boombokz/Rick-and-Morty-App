import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/locations/location_model.dart';
import 'package:rick_and_morty_test/network_service/locations_network_service.dart';

part 'locations_list_event.dart';

part 'locations_list_state.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc() : super(LocationsListLoadingState());

  LocationsNetworkService locationsNetworkService = LocationsNetworkService();

  @override
  Stream<LocationsListState> mapEventToState(
    LocationsListEvent event,
  ) async* {
    if (event is LocationsListLoadEvent) {
      yield LocationsListLoadingState();
      try {
        List<Location> loadedLocations =
            await locationsNetworkService.getLocations();

        yield LocationsListLoadedState(loadedLocations: loadedLocations);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LocationsListLoadErrorState();
      }
    }
  }
}
