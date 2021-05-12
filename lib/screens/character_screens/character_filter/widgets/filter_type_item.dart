import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';

class FilterTypeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  FilterTypeItem(
      {required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.searchScreenTextStyle.copyWith(
                      color: ColorPalette.whiteColor.withOpacity(0.87)),
                ),
                Text(
                  subtitle,
                  style: TextStyles.whiteTextStyle.copyWith(
                      color: ColorPalette.greyColor.withOpacity(0.60)),
                ),
              ],
            ),
            SvgPicture.asset(IconsRes.arrowRightIcon),
          ],
        ),
      ),
    );
  }
}
