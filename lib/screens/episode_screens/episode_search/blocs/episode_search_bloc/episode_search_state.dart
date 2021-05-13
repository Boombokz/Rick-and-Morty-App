part of 'episode_search_bloc.dart';

@immutable
abstract class EpisodeSearchState {}

class EpisodeSearchInitial extends EpisodeSearchState {}

class EpisodeSearchLoadingState extends EpisodeSearchState {}

class EpisodeSearchedState extends EpisodeSearchState {
  final List<Episode> searchedEpisodes;

  EpisodeSearchedState({required this.searchedEpisodes});
}

class EpisodeSearchErrorState extends EpisodeSearchState {}