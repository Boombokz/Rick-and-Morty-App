import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode/widgets/episode_search_card.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode/widgets/seasons_tabbar.dart';

class EpisodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
              ),
              child: EpisodeSearchCard(),
            ),
            SizedBox(height: 15),
            SeasonsTabBar(),
          ],
        ),
      ),
    );
  }
}
