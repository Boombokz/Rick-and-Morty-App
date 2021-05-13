import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

class DefineTextStyle {
  static TextStyle statusTextStyle(String status) {
    switch (status) {
      case 'Alive':
        return TextStyles.statusTextStyle;
      case 'Dead':
        return TextStyles.statusTextStyle
            .copyWith(color: ColorPalette.redColor);
      case 'unknown':
        return TextStyles.statusTextStyle
            .copyWith(color: ColorPalette.greyColor);
      default:
        return TextStyles.statusTextStyle;
    }
  }
}