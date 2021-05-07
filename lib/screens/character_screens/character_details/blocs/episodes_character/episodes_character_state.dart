part of 'episodes_character_bloc.dart';

@immutable
abstract class EpisodesCharacterState {}

class EpisodesCharacterInitial extends EpisodesCharacterState {}

class EpisodesCharacterLoadingState extends EpisodesCharacterState {}

class EpisodesCharacterLoadedState extends EpisodesCharacterState {
  final List<Episode> episodes;
  EpisodesCharacterLoadedState({required this.episodes});
}

class EpisodesCharacterErrorState extends EpisodesCharacterState {}
