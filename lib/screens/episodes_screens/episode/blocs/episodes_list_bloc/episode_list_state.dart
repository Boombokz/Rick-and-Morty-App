part of 'episode_list_bloc.dart';

@immutable
abstract class EpisodesListState {}

class EpisodesListLoadingState extends EpisodesListState {}

class EpisodesListLoadedState extends EpisodesListState {
  final List<Episode> loadedEpisodes;

  EpisodesListLoadedState({required this.loadedEpisodes});
}

class EpisodesListLoadErrorState extends EpisodesListState {}
