import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/back_icon_button.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
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
      padding: EdgeInsets.only(left: 8, right: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackIconButton(),
          Container(
            width: MediaQuery.of(context).size.width - 175,
            child: TextField(
              style: Theme.of(context).textTheme.headline4,
              autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Find character',
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              textController.clear();
              widget.clearSearchedCharacters();
              BlocProvider.of<CharacterSearchBloc>(context)
                  .add(CharacterSearchInitialEvent());
            },
            splashRadius: 8,
            icon: SvgPicture.asset(
              IconsRes.cancelIcon,
              color: Theme.of(context).colorScheme.onSecondary,
              width: 30,
            ),

          ),

        ],
      ),
    );
  }
}
