import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_listview.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';

import 'package:rick_and_morty_test/screens/character_screens/character_search/widgets/search_widget.dart';

class CharacterSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.screenBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 23),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
              ),
              BlocBuilder<CharacterSearchBloc, CharacterSearchState>(
                builder: (context, state) {
                  if (state is CharacterSearchLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CharacterSearchInitial) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Center(
                        child: Text(
                          'Enter character\'s name',
                          style: TextStyles.searchScreenTextStyle,
                        ),
                      ),
                    );
                  } else if (state is CharacterSearchedState) {
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: CharactersListView(
                              characters: state.searchedCharacters,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is CharacterSearchErrorState) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 59),
                          Image.asset(Images.characterSearchErrorImage),
                          SizedBox(height: 28),
                          Text(
                            'Character with this name',
                            style: TextStyles.searchScreenTextStyle,
                          ),
                          Text(
                            'was not found',
                            style: TextStyles.searchScreenTextStyle,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Offstage();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
