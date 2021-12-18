part of 'locations_list_bloc.dart';

@immutable
abstract class LocationsListState {}

class LocationsListLoadingState extends LocationsListState {}

class LocationsListLoadedState extends LocationsListState {
  final List<Location> loadedLocations;

  LocationsListLoadedState({required this.loadedLocations});
}

class LocationsListLoadErrorState extends LocationsListState {}
