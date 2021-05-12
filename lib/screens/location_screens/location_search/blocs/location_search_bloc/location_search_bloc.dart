import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/models/locations/location_model.dart';
import 'package:rick_and_morty_test/network_service/locations_network_service.dart';

part 'location_search_event.dart';

part 'location_search_state.dart';

class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  LocationSearchBloc() : super(LocationSearchInitial());
  int page = 1;
  bool isFetching = false;
  bool isFirstTime = false;

  LocationsNetworkService locationsNetworkService = LocationsNetworkService();

  @override
  Stream<LocationSearchState> mapEventToState(
    LocationSearchEvent event,
  ) async* {
    if (event is LocationSearchStartEvent) {
      yield LocationSearchLoadingState();
      if (isFirstTime == true) {
        page = 1;
      }
      try {
        List<Location> searchedLocations = [];
        int pages = await locationsNetworkService
            .getLocationSearchPagesCount(event.text);

        if (page <= pages) {
          searchedLocations =
              await locationsNetworkService.searchLocations(event.text, page);
        }

        yield LocationSearchedState(searchedLocations: searchedLocations);
        page++;
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LocationSearchErrorState();
      }
    }

    if (event is LocationSearchInitialEvent) {
      yield LocationSearchInitial();
    }
  }
}
