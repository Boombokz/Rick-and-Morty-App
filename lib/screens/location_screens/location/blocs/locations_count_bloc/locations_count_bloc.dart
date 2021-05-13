import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/data/network/locations_api.dart';

part 'locations_count_event.dart';

part 'locations_count_state.dart';

class LocationsCountBloc
    extends Bloc<LocationsCountEvent, LocationsCountState> {
  LocationsCountBloc() : super(LocationsCountLoadingState());

  LocationsAPI locationAPI = LocationsAPI();

  @override
  Stream<LocationsCountState> mapEventToState(
    LocationsCountEvent event,
  ) async* {
    if (event is LocationsCountLoadEvent) {
      yield LocationsCountLoadingState();
      try {
        int totalCount = await locationAPI.getTotalLocationsCount();
        yield LocationsCountLoadedState(totalCount: totalCount);
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);

        yield LocationsCountErrorState();
      }
    }
  }
}
