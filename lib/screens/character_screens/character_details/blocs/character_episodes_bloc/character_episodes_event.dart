part of 'character_episodes_bloc.dart';

@immutable
abstract class CharacterEpisodesEvent {}

class CharacterEpisodesLoadEvent extends CharacterEpisodesEvent {
  final List<String> episodes;
  CharacterEpisodesLoadEvent({required this.episodes});
}
