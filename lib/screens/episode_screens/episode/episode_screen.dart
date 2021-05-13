import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/episode_search_card.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/seasons_tabbar.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

class EpisodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
