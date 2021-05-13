import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/widgets/episode_listtile.dart';

class SeasonTab extends StatelessWidget {
  final List<Episode> loadedEpisodes;

  SeasonTab({required this.loadedEpisodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: loadedEpisodes.length,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: EpisodeListTile(
              episode: loadedEpisodes[index],
            ),
          );
        });
  }
}


