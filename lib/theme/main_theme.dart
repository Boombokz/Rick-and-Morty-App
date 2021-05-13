import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

class MainThemes {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: ColorPalette.darkBlueColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.greyBackgroundColor,
      selectedItemColor: ColorPalette.lightGreenColor,
      unselectedItemColor: ColorPalette.darkGreyColor,
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.darkGreyColor,
    ),
    brightness: Brightness.dark,
    dividerTheme: DividerThemeData(
      color: ColorPalette.greyBackgroundColor,
      thickness: 2,
    ),
    dialogTheme: DialogTheme(

    ),
  );
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: ColorPalette.whiteColor,
    brightness: Brightness.light,
  );
}
