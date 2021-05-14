import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';

class LinkedLocationCharacterListTile extends StatelessWidget {
  final Character character;

  LinkedLocationCharacterListTile({required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          BlocProvider.of<CharacterEpisodesBloc>(context)
            ..add(CharacterEpisodesLoadEvent(episodes: character.episode));
          Navigator.pushNamed(
              context, RouteGenerator.characterDetailsScreenRoute,
              arguments: character);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                height: 74,
                width: 74,
                image: NetworkImage(character.image),
                fit: BoxFit.fill,
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
                    style: Theme.of(context).textTheme.headline1,
                    ),

                  Text(
                    '${character.species}, ${character.gender}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(IconsRes.arrowRightIcon, color: Theme.of(context).colorScheme.onSecondary,),
          ],
        ),
      ),
    );
  }
}
