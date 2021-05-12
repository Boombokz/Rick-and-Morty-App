import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/character_listtile.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchCharactersListView extends StatelessWidget {
  final List<Character> characters;
  final ScrollController _scrollController = ScrollController();

  SearchCharactersListView({required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                BlocProvider.of<CharacterSearchBloc>(context).isFetching ==
                    false) {
              BlocProvider.of<CharacterSearchBloc>(context)
                ..isFirstTime = false
                ..add(CharacterSearchStartEvent(
                    text: store.get('characterSearchText')));
              BlocProvider.of<CharacterSearchBloc>(context)..isFetching = true;
            }
          }),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: characters.length +
            (BlocProvider.of<CharacterSearchBloc>(context).isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CharacterListTile(
                character: characters[index],
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
