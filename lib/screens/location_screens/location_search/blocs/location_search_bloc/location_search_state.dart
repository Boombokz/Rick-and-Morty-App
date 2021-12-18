part of 'location_search_bloc.dart';

@immutable
abstract class LocationSearchState {}

class LocationSearchInitial extends LocationSearchState {}

class LocationSearchLoadingState extends LocationSearchState {}

class LocationSearchedState extends LocationSearchState {
  final List<Location> searchedLocations;

  LocationSearchedState({required this.searchedLocations});
}

class LocationSearchErrorState extends LocationSearchState {}