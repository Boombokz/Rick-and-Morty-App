import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  EpisodeListTile({required this.episode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        BlocProvider.of<EpisodesCharacterBloc>(context)..add(
            EpisodesCharacterLoadEvent(
                linkedCharactersURLs: episode.characters));
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
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Episode ${episode.id}'.toUpperCase(),
                  style: TextStyles.characterStatusStyle.copyWith(
                    color: ColorPalette.lightBlueColor.withOpacity(0.87),
                  ),
                ),
                Text(
                  '${episode.name}',
                  style: TextStyles.characterNameStyle.copyWith(
                    color: ColorPalette.whiteColor.withOpacity(0.87),
                  ),
                ),
                Text(
                  '${episode.air_date}',
                  style: TextStyles.greyTextStyle
                      .copyWith(color: ColorPalette.greyColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}