import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/components/search_card.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/icon_changing_widget.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/listview_changing_widget.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

class CharacterScreen extends StatelessWidget {
  final List<Character> _characters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.splashScreenColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
              ),
              child: SearchCard(
                hintText: 'Find character',
                onTextTap: () {
                  BlocProvider.of<CharacterSearchBloc>(context)
                    ..add(CharacterSearchInitialEvent());
                  Navigator.pushNamed(
                      context, RouteGenerator.characterSearchScreenRoute);
                },
                onFilterTap: () {
                  Navigator.pushNamed(
                      context, RouteGenerator.characterFilterScreenRoute);
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<CharactersCountBloc, CharactersCountState>(
                          builder: (context, state) {
                            if (state is CharactersCountLoadedState) {
                              return Text(
                                'Total characters: ${state.totalCount}'
                                    .toUpperCase(),
                                style: TextStyles.charactersTextStyle,
                              );
                            } else if (state is CharactersCountLoadingState) {
                              return Offstage();
                            } else if (state is CharacterCountErrorState) {
                              return Text(
                                'Error'.toUpperCase(),
                                style: TextStyles.charactersTextStyle,
                              );
                            } else {
                              return Offstage();
                            }
                          },
                        ),
                        IconChangingWidget(),
                      ],
                    ),
                  ),
                  BlocBuilder<CharactersListBloc, CharactersListState>(
                    builder: (context, state) {
                      if (state is CharactersListLoadingState &&
                          _characters.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CharactersListLoadedState) {
                        //check to prevent add duplicate elements when redrawing the screen
                        _characters.addAll((state.loadedCharacters)
                            .where((e) => !_characters.contains(e)));

                        context.read<CharactersListBloc>()..isFetching = false;
                      } else if (state is CharactersListLoadErrorState &&
                          _characters.isEmpty) {
                        return Center(
                          child: Text('Error'),
                        );
                      }
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                                child: ListViewChangingWidget(
                              characters: _characters,
                            )),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
