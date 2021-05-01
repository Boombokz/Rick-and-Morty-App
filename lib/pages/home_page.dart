import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/widgets/appbar_widget.dart';
import 'package:rick_and_morty_test/widgets/charactes_listview.dart';
import 'package:rick_and_morty_test/blocs/characters_list_bloc/characters_list_bloc.dart';

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
        child: BlocBuilder<CharactersListBloc, CharactersListState>(
          builder: (context, state) {
            if (state is CharactersListLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CharactersListLoadedState) {
              return CharactersListView(
                characters: state.loadedCharacters,
              );
            } else if (state is CharactersListLoadErrorState) {
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
