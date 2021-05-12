import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;

  CharacterListTile({required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        BlocProvider.of<CharactersEpisodeBloc>(context)
            .add(EpisodesCharacterLoadEvent(episodes: character.episode));
        Navigator.pushNamed(
          context,
          RouteGenerator.characterDetailsScreenRoute,
          arguments: character,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FadeInImage.memoryNetwork(
              fadeInDuration: Duration(milliseconds: 150),
              fadeOutDuration: Duration(milliseconds: 150),
              width: 74,
              height: 74,
              image: character.image,
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
            ),
          ),
          SizedBox(width: 13.5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${character.status}'.toUpperCase(),
                  style: DefineTextStyle.statusTextStyle(character.status),
                ),
                Text(
                  '${character.name}',
                  style: TextStyles.characterNameStyle,
                ),
                Text(
                  '${character.species}, ${character.gender}',
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