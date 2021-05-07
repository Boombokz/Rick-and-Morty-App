import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

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
              autofocus: true,
              controller: searchController,
              onTap: () {},
              onChanged: (newValue) {
                if(newValue != '') {
                  BlocProvider.of<CharacterSearchBloc>(context).add(
                      CharacterSearchStartEvent(text: searchController.text));
                } else {
                  BlocProvider.of<CharacterSearchBloc>(context).add(
                      CharacterSearchInitialEvent());
                }

              },
              decoration: InputDecoration(
                hintText: 'Find character',
                hintStyle: TextStyles.searchTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              searchController.clear();
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
