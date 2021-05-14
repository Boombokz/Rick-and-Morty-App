import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/widgets/linked_episode_character_listtile.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;

class LinkedEpisodeCharacters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Characters',
                style: Theme.of(context).textTheme.headline3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('MainScreen'));
                  globals.tabController.animateTo(0);
                },
                child: Text(
                  'All characters',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<EpisodesCharacterBloc, EpisodesCharacterState>(
          builder: (context, state) {
            if (state is EpisodesCharacterLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EpisodesCharacterLoadedState) {
              return Container(
                height: 500,
                child: ListView.builder(
                    itemCount: state.linkedCharacters.length,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      return LinkedEpisodeCharacterListTile(
                          character: state.linkedCharacters[index]);
                    }),
              );
            } else if (state is EpisodesCharacterErrorState) {
              return Center(
                child: Text('ERROR'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ],
    );
  }
}
