import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/search_card.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_gridview.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/widgets/characters_listview.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isListViewChanged = false;

  List<Character> _characters = [];

  @override
  void initState() {
    if (store.get('isListViewChanged') != null) {
      isListViewChanged = store.get('isListViewChanged');
    }

    BlocProvider.of<CharactersListBloc>(context)
      ..page = 1
      ..isFetching = true
      ..add(CharactersListLoadEvent());
    super.initState();
  }

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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isListViewChanged = !isListViewChanged;
                              store.set('isListViewChanged', isListViewChanged);
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
                      if (state is CharactersListLoadingState &&
                          _characters.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CharactersListLoadedState) {
                        if (BlocProvider.of<CharactersListBloc>(context).page ==
                            1) {
                          _characters.clear();
                        } else {
                          _characters.addAll(state.loadedCharacters);

                          context.read<CharactersListBloc>()
                            ..isFetching = false;
                        }
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
                              child: !isListViewChanged
                                  ? CharactersListView(
                                      characters: _characters,
                                    )
                                  : CharactersGridView(
                                      characters: _characters,
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
          ],
        ),
      ),
    );
  }
}
