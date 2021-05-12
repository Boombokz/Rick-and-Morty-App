part of 'episodes_character_bloc.dart';

@immutable
abstract class EpisodesCharacterState {}

class EpisodesCharacterInitial extends EpisodesCharacterState {}

class EpisodesCharacterLoadingState extends EpisodesCharacterState {}

class EpisodesCharacterLoadedState extends EpisodesCharacterState {
  final List<Character> linkedCharacters;
  EpisodesCharacterLoadedState({required this.linkedCharacters});
}

class EpisodesCharacterErrorState extends EpisodesCharacterState {}