import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/theme/themes.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';

class CharacterGridTile extends StatelessWidget {
  final Character character;

  CharacterGridTile({required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        BlocProvider.of<CharacterEpisodesBloc>(context)
            .add(CharacterEpisodesLoadEvent(episodes: character.episode));
        Navigator.pushNamed(
          context,
          RouteGenerator.characterDetailsScreenRoute,
          arguments: character,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              height: 120,
              width: 120,
              image: NetworkImage(character.image),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${character.status}'.toUpperCase(),
                  style: DefineTextStyle.statusTextStyle(character.status),
                ),
                Text(
                  '${character.name}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '${character.species}, ${character.gender}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
