import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/widgets/search_episode_widget.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/widgets/search_episodes_listview.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

class EpisodeSearchScreen extends StatelessWidget {
  final List<Episode> _searchedEpisodes = [];

  EpisodeSearchScreen({Key? key}) : super(key: key);

  void clearSearchedEpisodes() {
    _searchedEpisodes.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchEpisodeWidget(clearSearchedEpisodes: clearSearchedEpisodes),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              BlocBuilder<EpisodeSearchBloc, EpisodeSearchState>(
                builder: (context, state) {
                  if (state is EpisodeSearchLoadingState &&
                      _searchedEpisodes.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is EpisodeSearchInitial) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Center(
                        child: Text(
                          'Enter episode\'s name',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    );
                  } else if (state is EpisodeSearchedState) {
                    _searchedEpisodes.addAll(state.searchedEpisodes);

                    BlocProvider.of<EpisodeSearchBloc>(context).isFetching =
                        false;
                  } else if (state is EpisodeSearchErrorState &&
                      _searchedEpisodes.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 59),
                          Image.asset(Images.episodeSearchErrorImage),
                          const SizedBox(height: 28),
                          const Text(
                            'Character with this name',
                            style: TextStyles.headline2,
                          ),
                          const Text(
                            'was not found',
                            style: TextStyles.headline2,
                          ),
                        ],
                      ),
                    );
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: SearchEpisodesListView(
                            episodes: _searchedEpisodes,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
