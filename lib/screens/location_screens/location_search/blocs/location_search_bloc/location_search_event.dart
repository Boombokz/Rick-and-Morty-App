part of 'location_search_bloc.dart';

@immutable
abstract class LocationSearchEvent {}

class LocationSearchInitialEvent extends LocationSearchEvent {}

class LocationSearchStartEvent extends LocationSearchEvent {
  final String text;
  LocationSearchStartEvent({required this.text});
}