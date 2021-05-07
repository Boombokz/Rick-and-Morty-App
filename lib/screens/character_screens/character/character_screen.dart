import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/search_card.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_gridview.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_listview.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isListViewChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
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
                onTap: () {
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isListViewChanged = !isListViewChanged;
                            });
                          },
                          child: isListViewChanged
                              ? SvgPicture.asset(IconsRes.listChangeIcon)
                              : SvgPicture.asset(IconsRes.gridChangeIcon),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CharactersListBloc, CharactersListState>(
                    builder: (context, state) {
                      if (state is CharactersListLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CharactersListLoadedState) {
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: !isListViewChanged
                                    ? CharactersListView(
                                        characters: state.loadedCharacters,
                                      )
                                    : CharactersGridView(
                                        characters: state.loadedCharacters),
                              ),
                            ],
                          ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
