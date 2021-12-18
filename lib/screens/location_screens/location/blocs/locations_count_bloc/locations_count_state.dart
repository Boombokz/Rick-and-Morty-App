part of 'locations_count_bloc.dart';

@immutable
abstract class LocationsCountState {}

class LocationsCountLoadedState extends LocationsCountState {
  final int totalCount;

  LocationsCountLoadedState({required this.totalCount});
}

class LocationsCountLoadingState extends LocationsCountState {}

class LocationsCountErrorState extends LocationsCountState {}
