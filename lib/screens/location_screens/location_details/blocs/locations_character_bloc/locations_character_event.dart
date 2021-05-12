part of 'locations_character_bloc.dart';

@immutable
abstract class LocationsCharacterEvent {}

class LocationsCharacterLoadEvent extends LocationsCharacterEvent {
  final List<String> linkedCharactersURLs;
  LocationsCharacterLoadEvent({required this.linkedCharactersURLs});
}
