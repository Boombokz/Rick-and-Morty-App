import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/widgets/search_episode_widget.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/widgets/search_episodes_listview.dart';

class EpisodeSearchScreen extends StatelessWidget {
  final List<Episode> _searchedEpisodes = [];

  void clearSearchedEpisodes() {
    _searchedEpisodes.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.splashScreenColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchEpisodeWidget(clearSearchedEpisodes: clearSearchedEpisodes),
              SizedBox(height: 23),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
              ),
              BlocBuilder<EpisodeSearchBloc, EpisodeSearchState>(
                builder: (context, state) {
                  if (state is EpisodeSearchLoadingState &&
                      _searchedEpisodes.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is EpisodeSearchInitial) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Center(
                        child: Text(
                          'Enter episode\'s name',
                          style: TextStyles.searchScreenTextStyle,
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
                          SizedBox(height: 59),
                          Image.asset(Images.episodeSearchErrorImage),
                          SizedBox(height: 28),
                          Text(
                            'Character with this name',
                            style: TextStyles.searchScreenTextStyle,
                          ),
                          Text(
                            'was not found',
                            style: TextStyles.searchScreenTextStyle,
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
