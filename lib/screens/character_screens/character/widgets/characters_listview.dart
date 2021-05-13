import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';

import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_listtile.dart';

class CharactersListView extends StatefulWidget {
  final List<Character> characters;

  CharactersListView({required this.characters});

  @override
  _CharactersListViewState createState() => _CharactersListViewState();
}

class _CharactersListViewState extends State<CharactersListView> {
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
                ..add(CharactersListLoadEvent());
              context.read<CharactersListBloc>()..isFetching = true;
            }
          }),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: widget.characters.length +
            (context.read<CharactersListBloc>().isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < widget.characters.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CharacterListTile(
                character: widget.characters[index],
              ),
            );
          } else {
            Timer(Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });

            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
