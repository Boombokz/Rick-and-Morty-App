import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

class SearchCard extends StatelessWidget {
  final String hintText;
  final VoidCallback onFilterTap;
  final VoidCallback onTextTap;

  SearchCard(
      {required this.hintText,
      required this.onTextTap,
      required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorPalette.greyBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(IconsRes.searchIcon),
          SizedBox(width: 14),
          GestureDetector(
            onTap: onTextTap,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 160,
              alignment: Alignment.centerLeft,
              child: Text(
                hintText,
                style: TextStyles.searchTextStyle,
              ),
            ),
          ),
          Container(
            height: 24,
            child: VerticalDivider(
              thickness: 1,
              color: ColorPalette.whiteColor.withOpacity(0.1),
            ),
          ),
          InkWell(
            onTap: onFilterTap,
            child: SvgPicture.asset(IconsRes.filterIcon),
          ),
        ],
      ),
    );
  }
}
