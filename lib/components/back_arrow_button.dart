import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';

class BackArrowButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 54,
      left: 16,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPalette.greyBackgroundColor),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: SvgPicture.asset(
              IconsRes.arrowBackIcon,
            ),
          ),
        ),
      ),
    );
  }
}
