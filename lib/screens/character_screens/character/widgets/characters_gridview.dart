import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_gridtile.dart';

class CharactersGridView extends StatelessWidget {
  final List<Character> characters;
  final ScrollController _scrollController = ScrollController();

  CharactersGridView({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                !context.read<CharactersListBloc>().isFetching) {
              context.read<CharactersListBloc>()
                .add(CharactersListLoadEvent());
              context.read<CharactersListBloc>().isFetching = true;
            }
          }),
        padding: const EdgeInsets.symmetric(vertical: 28),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 8,
          mainAxisSpacing: 24,
        ),
        shrinkWrap: true,
        itemCount: characters.length +
            (context.read<CharactersListBloc>().isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return CharacterGridTile(
              character: characters[index],
            );
          } else {
            Timer(const Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });
            return Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: const [
                Positioned(
                  right: -30,
                  bottom: 0,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        });
  }
}
