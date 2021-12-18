import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  const EpisodeListTile({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        BlocProvider.of<EpisodesCharacterBloc>(context).add(
            EpisodesCharacterLoadEvent(
                linkedCharactersURLs: episode.characters ?? []));
        Navigator.pushNamed(
          context,
          RouteGenerator.episodesDetailsScreenRoute,
          arguments: episode,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPalette.whiteColor.withOpacity(0.65),
              ),
              child: Image.asset(
                Images.episodeDetailsImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Episode ${episode.id}'.toUpperCase(),
                  style: TextStyles.statusTextStyle.copyWith(
                    color: ColorPalette.lightBlueColor.withOpacity(0.87),
                  ),
                ),
                Text(
                  '${episode.name}',
                  style: Theme.of(context).textTheme.headline1,

                ),
                Text(
                  '${episode.airDate}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}