import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/widgets/character_listtile.dart';

class CharactersListView extends StatelessWidget {
  final List<Character> characters;

  CharactersListView({required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20.5,
      ),
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: characters.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 9.48);
          },
          itemBuilder: (context, index) {
            return CharacterListTile(
              character: characters[index],
            );
          }),
    );
  }
}
