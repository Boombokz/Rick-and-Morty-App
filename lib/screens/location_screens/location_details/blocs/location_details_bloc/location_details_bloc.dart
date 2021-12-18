import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/data/network/locations_api.dart';

part 'location_details_event.dart';

part 'location_details_state.dart';

class LocationDetailsBloc
    extends Bloc<LocationDetailsEvent, LocationDetailsState> {
  LocationDetailsBloc() : super(LocationDetailsLoadingState());

  LocationsAPI locationsAPI = LocationsAPI();

  @override
  Stream<LocationDetailsState> mapEventToState(
    LocationDetailsEvent event,
  ) async* {
    if (event is LocationDetailsStartEvent) {
      yield LocationDetailsLoadingState();
      try {
        Location selectedLocation =
            await locationsAPI.getLocationDetails(event.locationID);

        yield LocationDetailsLoadState(location: selectedLocation);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LocationDetailsErrorState();
      }
    }
  }
}
