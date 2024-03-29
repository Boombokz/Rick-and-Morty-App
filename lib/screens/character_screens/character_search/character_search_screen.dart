import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/widgets/search_character_widget.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/widgets/search_characters_listview.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

class CharacterSearchScreen extends StatelessWidget {
  final List<Character> _searchedCharacters = [];

  CharacterSearchScreen({Key? key}) : super(key: key);

  void clearSearchedCharacters() {
    _searchedCharacters.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchCharacterWidget(
                clearSearchedCharacters: clearSearchedCharacters,
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              BlocBuilder<CharacterSearchBloc, CharacterSearchState>(
                builder: (context, state) {
                  if (state is CharacterSearchLoadingState &&
                      _searchedCharacters.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CharacterSearchInitial) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Center(
                        child: Text(
                          'Enter character\'s name',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    );
                  } else if (state is CharacterSearchedState) {
                    _searchedCharacters.addAll(state.searchedCharacters);

                    BlocProvider.of<CharacterSearchBloc>(context).isFetching =
                        false;
                  } else if (state is CharacterSearchErrorState &&
                      _searchedCharacters.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 59),
                          Image.asset(Images.characterSearchErrorImage),
                          const SizedBox(height: 28),
                          const Text(
                            'Character with this name',
                            style: TextStyles.headline2,
                          ),
                          const Text(
                            'was not found',
                            style: TextStyles.headline2,
                          ),
                        ],
                      ),
                    );
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: SearchCharactersListView(
                            characters: _searchedCharacters,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
