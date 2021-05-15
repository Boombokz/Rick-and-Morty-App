part of 'location_details_bloc.dart';

@immutable
abstract class LocationDetailsEvent {}

class LocationDetailsStartEvent extends LocationDetailsEvent {
  final int locationID;

  LocationDetailsStartEvent({required this.locationID});
}
