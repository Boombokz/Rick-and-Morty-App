import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchCharacterWidget extends StatefulWidget {
  final Function clearSearchedCharacters;

  SearchCharacterWidget({
    required this.clearSearchedCharacters,
  });

  @override
  _SearchCharacterWidgetState createState() => _SearchCharacterWidgetState();
}

class _SearchCharacterWidgetState extends State<SearchCharacterWidget> {
  TextEditingController textController = TextEditingController();

  String previousValue = '';
  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      isChanged = previousValue != textController.text;

      if (textController.text.isEmpty) {
        widget.clearSearchedCharacters();
        BlocProvider.of<CharacterSearchBloc>(context)
          ..add(CharacterSearchInitialEvent());
        previousValue = '';
      } else if (isChanged) {
        BlocProvider.of<CharacterSearchBloc>(context).page = 1;

        BlocProvider.of<CharacterSearchBloc>(context)
          ..isFirstTime = true
          ..page = 1
          ..isFetching = true
          ..add(CharacterSearchStartEvent(text: textController.text));
        store.set('characterSearchText', textController.text);
        previousValue = textController.text;
      }
      widget.clearSearchedCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.greyBackgroundColor,
      padding: EdgeInsets.only(left: 21, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(IconsRes.arrowBackIcon),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 175,
            child: TextField(
              style: TextStyles.searchTextStyle
                  .copyWith(color: ColorPalette.whiteColor),
              autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Find character',
                hintStyle: TextStyles.searchTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              textController.clear();
              widget.clearSearchedCharacters();
              BlocProvider.of<CharacterSearchBloc>(context)
                  .add(CharacterSearchInitialEvent());
            },
            child: SvgPicture.asset(IconsRes.cancelIcon),
          ),
        ],
      ),
    );
  }
}
