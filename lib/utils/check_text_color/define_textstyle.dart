import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';

class DefineTextStyle {
  static TextStyle statusTextStyle(String status) {
    switch (status) {
      case 'Alive':
        return TextStyles.characterStatusStyle;
      case 'Dead':
        return TextStyles.characterStatusStyle
            .copyWith(color: ColorPalette.redColor);
      case 'unknown':
        return TextStyles.characterStatusStyle
            .copyWith(color: ColorPalette.greyColor);
      default:
        return TextStyles.characterStatusStyle;
    }
  }
}