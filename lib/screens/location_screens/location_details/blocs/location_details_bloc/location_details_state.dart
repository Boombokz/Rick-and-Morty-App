part of 'location_details_bloc.dart';

@immutable
abstract class LocationDetailsState {}

class LocationDetailsLoadingState extends LocationDetailsState {

}

class LocationDetailsLoadState extends LocationDetailsState {
  final Location location;

  LocationDetailsLoadState({required this.location});
}

class LocationDetailsErrorState extends LocationDetailsState {

}
