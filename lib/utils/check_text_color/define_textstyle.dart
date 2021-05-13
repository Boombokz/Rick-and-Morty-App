import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

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