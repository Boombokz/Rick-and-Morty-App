import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/episode_search_card.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/seasons_tabbar.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: const [
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
