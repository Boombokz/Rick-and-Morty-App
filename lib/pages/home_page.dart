import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/blocs/character_bloc/character_bloc.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/widgets/appbar_widget.dart';
import 'package:rick_and_morty_test/widgets/charactes_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Rick and Morty',
        backButton: false,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Color(0xFFE4E4E4).withOpacity(0.20), width: 1),
          ),
        ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CharacterLoadedState) {
              return CharactersListView(
                characters: state.loadedCharacters,
              );
            } else if (state is CharacterLoadErrorState) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ),
    );
  }
}
