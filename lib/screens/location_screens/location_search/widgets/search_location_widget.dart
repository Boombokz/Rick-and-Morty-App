import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchLocationWidget extends StatefulWidget {
  final Function clearSearchedLocations;

  SearchLocationWidget({required this.clearSearchedLocations});

  @override
  _SearchLocationWidgetState createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  TextEditingController textController = TextEditingController();

  String previousValue = '';
  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      isChanged = previousValue != textController.text;

      if (textController.text.isEmpty) {
        widget.clearSearchedLocations();
        BlocProvider.of<LocationSearchBloc>(context)
          ..add(LocationSearchInitialEvent());
      } else if (isChanged) {
        BlocProvider.of<LocationSearchBloc>(context).page = 1;

        BlocProvider.of<LocationSearchBloc>(context)
          ..isFirstTime = true
          ..page = 1
          ..isFetching = true
          ..add(LocationSearchStartEvent(text: textController.text));
        store.set('locationSearchText', textController.text);
        previousValue = textController.text;
      }
      widget.clearSearchedLocations();
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
                hintText: 'Find location',
                hintStyle: TextStyles.searchTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              textController.clear();
              widget.clearSearchedLocations();
              BlocProvider.of<LocationSearchBloc>(context)
                ..add(LocationSearchInitialEvent());
            },
            child: SvgPicture.asset(IconsRes.cancelIcon),
          ),
        ],
      ),
    );
  }
}
