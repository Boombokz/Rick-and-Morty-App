import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_gridtile.dart';


class CharactersGridView extends StatelessWidget {
  final List<Character> characters;

  CharactersGridView({required this.characters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 28),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 8,
          mainAxisSpacing: 24,
        ),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterGridTile(
            character: characters[index],
          );
        });
  }
}
