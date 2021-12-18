import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';

import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_listtile.dart';

class CharactersListView extends StatelessWidget {
  final List<Character> characters;

  CharactersListView({Key? key, required this.characters}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: characters.length +
            (context.read<CharactersListBloc>().isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CharacterListTile(
                character: characters[index],
              ),
            );
          } else {
            Timer(const Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });

            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
