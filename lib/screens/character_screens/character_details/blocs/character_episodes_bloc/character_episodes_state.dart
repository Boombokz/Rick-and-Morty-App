part of 'character_episodes_bloc.dart';

@immutable
abstract class CharacterEpisodesState {}

class CharacterEpisodesInitial extends CharacterEpisodesState {}

class CharacterEpisodesLoadingState extends CharacterEpisodesState {}

class CharacterEpisodesLoadedState extends CharacterEpisodesState {
  final List<Episode> episodes;
  CharacterEpisodesLoadedState({required this.episodes});
}

class CharacterEpisodesErrorState extends CharacterEpisodesState {}
