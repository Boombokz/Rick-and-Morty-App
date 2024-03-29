import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/widgets/episode_listtile.dart';

class SeasonTab extends StatelessWidget {
  final List<Episode> loadedEpisodes;

  const SeasonTab({Key? key, required this.loadedEpisodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: loadedEpisodes.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: EpisodeListTile(
              episode: loadedEpisodes[index],
            ),
          );
        });
  }
}


