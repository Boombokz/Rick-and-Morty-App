import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/widgets/episode_listtile.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchEpisodesListView extends StatelessWidget {
  final List<Episode> episodes;
  final ScrollController _scrollController = ScrollController();

  SearchEpisodesListView({required this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                BlocProvider.of<EpisodeSearchBloc>(context).isFetching ==
                    false) {
              BlocProvider.of<EpisodeSearchBloc>(context)
                ..isFirstTime = false
                ..add(EpisodeSearchStartEvent(
                    text: store.get('episodeSearchText')));
              BlocProvider.of<EpisodeSearchBloc>(context)..isFetching = true;
            }
          }),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: episodes.length +
            (BlocProvider.of<EpisodeSearchBloc>(context).isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < episodes.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: EpisodeListTile(
                episode: episodes[index],
              ),
            );
          } else {
            Timer(Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
