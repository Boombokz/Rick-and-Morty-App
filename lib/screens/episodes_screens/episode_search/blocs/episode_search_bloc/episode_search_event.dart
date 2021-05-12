part of 'episode_search_bloc.dart';

@immutable
abstract class EpisodeSearchEvent {}

class EpisodeSearchInitialEvent extends EpisodeSearchEvent {}

class EpisodeSearchStartEvent extends EpisodeSearchEvent {
  final String text;

  EpisodeSearchStartEvent({required this.text});
}
