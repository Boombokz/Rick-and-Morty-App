part of 'character_episodes_bloc.dart';

@immutable
abstract class EpisodesCharacterEvent {}

class EpisodesCharacterLoadEvent extends EpisodesCharacterEvent {
  final List<String> episodes;
  EpisodesCharacterLoadEvent({required this.episodes});
}
