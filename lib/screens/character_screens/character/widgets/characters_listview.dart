import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_listtile.dart';

class CharactersListView extends StatelessWidget {
  final List<Character> characters;

  CharactersListView({required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: CharacterListTile(
              character: characters[index],
            ),
          );
        });
  }
}
