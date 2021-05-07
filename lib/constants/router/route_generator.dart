import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/character_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/character_details_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_filter/character_filter_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/character_search_screen.dart';
import 'package:rick_and_morty_test/screens/main/main_screen.dart';
import 'package:rick_and_morty_test/screens/splash/splash_screen.dart';

class RouteGenerator {
  static const String mainScreenRoute = 'MainScreen';
  static const String characterScreenRoute = 'CharacterScreen';
  static const String splashScreenRoute = 'SplashScreen';
  static const String characterDetailsScreenRoute = 'CharacterDetailsScreen';
  static const String characterSearchScreenRoute = 'CharacterSearchScreen';
  static const String characterFilterScreenRoute = 'CharacterFilterScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreenRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case characterScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterScreen());
      case characterDetailsScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CharacterDetailsScreen(
              selectedCharacter: settings.arguments as Character),
        );
      case characterSearchScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterSearchScreen());
      case characterFilterScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterFilterScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Страница не существует'),
            ),
          ),
        );
    }
  }
}
