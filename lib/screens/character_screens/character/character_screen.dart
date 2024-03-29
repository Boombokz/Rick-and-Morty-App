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

class CharacterScreen extends StatelessWidget {
  final List<Character> _characters = [];

  CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
              ),
              child: SearchCard(
                hintText: 'Find character',
                onTextTap: () {
                  BlocProvider.of<CharacterSearchBloc>(context)
                    .add(CharacterSearchInitialEvent());
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
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                style: Theme.of(context).textTheme.bodyText2,
                              );
                            } else if (state is CharactersCountLoadingState) {
                              return const Offstage();
                            } else if (state is CharacterCountErrorState) {
                              return Text(
                                'Error'.toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText2,
                              );
                            } else {
                              return const Offstage();
                            }
                          },
                        ),
                        const IconChangingWidget(),
                      ],
                    ),
                  ),
                  BlocBuilder<CharactersListBloc, CharactersListState>(
                    builder: (context, state) {
                      if (state is CharactersListLoadingState &&
                          _characters.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CharactersListLoadedState) {
                        //check to prevent add duplicate elements when redrawing the screen
                        _characters.addAll((state.loadedCharacters)
                            .where((e) => !_characters.contains(e)));

                        context.read<CharactersListBloc>().isFetching = false;
                      } else if (state is CharactersListLoadErrorState &&
                          _characters.isEmpty) {
                        return const Center(
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
