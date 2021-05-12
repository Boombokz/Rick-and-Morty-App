import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_details/widgets/episode_images_stack.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_details/widgets/linked_episode_characters.dart';


class EpisodesDetailsScreen extends StatelessWidget {
  final Episode selectedEpisode;

  EpisodesDetailsScreen({required this.selectedEpisode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EpisodeImagesStack(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 62),
                Center(
                  child: Text(
                    '${selectedEpisode.name}',
                    style: TextStyles.episodeNameTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 3),
                Center(
                  child: Text(
                    'Episode ${selectedEpisode.id}'.toUpperCase(),
                    style: TextStyles.charactersTextStyle.copyWith(
                      color: ColorPalette.lightBlueColor.withOpacity(0.87),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CharacterProperties(
                    title: 'Release date',
                    text: selectedEpisode.air_date,
                  ),
                ),
                DividerWidget(padding: 36),
                LinkedEpisodeCharacters(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
