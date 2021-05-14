import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

class MainThemes {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: ColorPalette.greyBlueColor,
    colorScheme: ColorScheme(
      secondary: ColorPalette.whiteColor.withOpacity(0.1),
      //circular progress indicator color
      primary: ColorPalette.whiteColor,
      //icons color
      onSecondary: ColorPalette.whiteColor,
      //filter title background
      background: ColorPalette.greyBlueColor,
      primaryVariant: ColorPalette.darkGreyColor,
      secondaryVariant: ColorPalette.whiteColor,

      brightness: Brightness.dark,
      onBackground: ColorPalette.darkBlueColor,
      surface: Colors.cyanAccent,
      error: ColorPalette.whiteColor,
      onPrimary: Colors.pinkAccent,
      onError: Colors.black,
      onSurface: Colors.yellow,
    ),
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: ColorPalette.darkBlueColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.greyBlueColor,
      selectedItemColor: ColorPalette.lightGreenColor,
      unselectedItemColor: ColorPalette.darkGreyColor,
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.darkGreyColor,
    ),
    dividerTheme: DividerThemeData(
      color: ColorPalette.greyBlueColor,
      thickness: 2,
    ),
    dialogTheme: DialogTheme(),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: ColorPalette.darkGreyColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: ColorPalette.grey6Color,
    colorScheme: ColorScheme(
      secondary: ColorPalette.grey4Color,
      //circular progress indicator color
      primary: ColorPalette.greyColor,
      onSecondary: ColorPalette.black1Color,
      background: ColorPalette.grey1Color,
      primaryVariant: ColorPalette.grey3Color,
      secondaryVariant: ColorPalette.grey3Color,

      brightness: Brightness.light,
      onBackground: ColorPalette.darkBlueColor,

      surface: Colors.cyanAccent,
      error: ColorPalette.whiteColor,
      onPrimary: Colors.pinkAccent,
      onSurface: Colors.yellow,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: ColorPalette.grey1Color,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.whiteColor,
      selectedItemColor: ColorPalette.lightBlueColor,
      unselectedItemColor: ColorPalette.grey4Color,
    ),
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    iconTheme: IconThemeData(
      color: ColorPalette.darkGreyColor,
    ),
    dividerTheme: DividerThemeData(
      color: ColorPalette.grey6Color,
      thickness: 2,
    ),
    dialogTheme: DialogTheme(),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: ColorPalette.grey4Color,
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: TextStyles.headline1.copyWith(color: ColorPalette.whiteColor),
    headline2: TextStyles.headline2.copyWith(color: ColorPalette.darkGreyColor),
    headline3: TextStyles.headline3.copyWith(color: ColorPalette.whiteColor),
    headline4: TextStyles.bodyText1.copyWith(color: ColorPalette.whiteColor),
    headline5: TextStyles.headline5
        .copyWith(color: ColorPalette.greyColor.withOpacity(0.6)),
    headline6: TextStyles.headline6.copyWith(color: ColorPalette.whiteColor),
    bodyText1: TextStyles.bodyText1.copyWith(color: ColorPalette.darkGreyColor),
    bodyText2: TextStyles.bodyText2.copyWith(
      color: ColorPalette.darkGreyColor,
    ),
    subtitle1: TextStyles.subtitle1.copyWith(
      color: ColorPalette.greyColor,
    ),
    subtitle2: TextStyles.subtitle2.copyWith(color: ColorPalette.whiteColor),
    caption: TextStyles.headline2.copyWith(color: ColorPalette.whiteColor),
    overline: TextStyles.headline5.copyWith(color: ColorPalette.whiteColor),
    button: TextStyles.episodeName.copyWith(color: ColorPalette.whiteColor),
    // display1: TextStyles.display1.copyWith(color: ColorPalette.whiteColor),
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline1: TextStyles.headline1.copyWith(color: ColorPalette.black1Color),
    headline2: TextStyles.headline2.copyWith(color: ColorPalette.grey3Color),
    headline3: TextStyles.headline3.copyWith(color: ColorPalette.black1Color),
    headline4: TextStyles.bodyText1.copyWith(color: ColorPalette.black1Color),
    headline5: TextStyles.headline5.copyWith(color: ColorPalette.grey3Color),
    headline6: TextStyles.headline6.copyWith(color: ColorPalette.black1Color),
    bodyText1: TextStyles.bodyText1.copyWith(color: ColorPalette.grey4Color),
    bodyText2: TextStyles.bodyText2.copyWith(
      color: ColorPalette.grey3Color,
    ),
    subtitle1: TextStyles.subtitle1.copyWith(
      color: ColorPalette.grey3Color,
    ),
    subtitle2: TextStyles.subtitle2.copyWith(color: ColorPalette.black1Color),
    caption: TextStyles.headline2.copyWith(color: ColorPalette.black1Color),
    overline: TextStyles.headline5.copyWith(color: ColorPalette.black1Color),
    button: TextStyles.episodeName.copyWith(color: ColorPalette.black1Color),
    // display1: TextStyles.display1.copyWith(color: ColorPalette.black1Color),
  );
}
