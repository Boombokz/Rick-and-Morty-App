part of 'locations_character_bloc.dart';

@immutable
abstract class LocationsCharacterState {}

class LocationsCharacterInitial extends LocationsCharacterState {}

class LocationsCharacterLoadingState extends LocationsCharacterState {}

class LocationsCharacterLoadedState extends LocationsCharacterState {
  final List<Character> linkedCharacters;
  LocationsCharacterLoadedState({required this.linkedCharacters});
}

class LocationsCharacterErrorState extends LocationsCharacterState {}
