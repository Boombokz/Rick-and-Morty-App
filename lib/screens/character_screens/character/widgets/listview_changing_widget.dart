import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_change_view_bloc/character_change_view_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_gridview.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_listview.dart';

class ListViewChangingWidget extends StatefulWidget {
  final List<Character> characters;

  ListViewChangingWidget({required this.characters});

  @override
  _ListViewChangingWidgetState createState() => _ListViewChangingWidgetState();
}

class _ListViewChangingWidgetState extends State<ListViewChangingWidget> {
  bool isListViewChanged = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterChangeViewBloc, CharacterChangeViewState>(
        builder: (context, state) {
      if (state is CharacterChangedViewState) {
        isListViewChanged = state.isChanged;
      }

      return !isListViewChanged
          ? CharactersListView(
              characters: widget.characters,
            )
          : CharactersGridView(
              characters: widget.characters,
            );
    });
  }
}
