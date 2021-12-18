import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/character_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/character_details_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_filter/character_filter_screen.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/character_search_screen.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/episode_screen.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/episodes_details_screen.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/episode_search_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/location_details_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_filter/filter_screens/location_dimension_filter_items_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_filter/filter_screens/location_type_filter_items_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_filter/location_filter_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/location_search_screen.dart';
import 'package:rick_and_morty_test/screens/main_screen/main_screen.dart';

import 'package:rick_and_morty_test/screens/splash/splash_screen.dart';

class RouteGenerator {
  static const String mainScreenRoute = 'MainScreen';
  static const String characterScreenRoute = 'CharacterScreen';
  static const String splashScreenRoute = 'SplashScreen';
  static const String characterDetailsScreenRoute = 'CharacterDetailsScreen';
  static const String characterSearchScreenRoute = 'CharacterSearchScreen';
  static const String characterFilterScreenRoute = 'CharacterFilterScreen';
  static const String episodesScreenRoute = 'EpisodeScreen';
  static const String locationDetailsScreenRoute = 'LocationDetailsScreen';
  static const String episodesDetailsScreenRoute = 'EpisodesDetailsScreen';
  static const String locationSearchScreenRoute = 'LocationSearchScreen';
  static const String episodeSearchScreenRoute = 'EpisodeSearchScreen';
  static const String locationFilterScreenRoute = 'LocationFilterScreen';
  static const String locationTypeFilterItemsScreenRoute =
      'LocationTypeFilterItemsScreen';
  static const String dimensionTypeFilterItemsScreenRoute =
      'LocationDimensionFilterItemsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreenRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: 'MainScreen'),
            builder: (_) => const MainScreen());
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
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
        return MaterialPageRoute(builder: (_) => const CharacterFilterScreen());
      case episodesScreenRoute:
        return MaterialPageRoute(builder: (_) => const EpisodeScreen());
      case locationDetailsScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LocationDetailsScreen(),
        );
      case locationSearchScreenRoute:
        return MaterialPageRoute(builder: (_) => LocationSearchScreen());
      case locationFilterScreenRoute:
        return MaterialPageRoute(builder: (_) => const LocationFilterScreen());
      case locationTypeFilterItemsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const LocationTypeFilterItemsScreen());
      case dimensionTypeFilterItemsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const LocationDimensionFilterItemsScreen());
      case episodesDetailsScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EpisodesDetailsScreen(
              selectedEpisode: settings.arguments as Episode),
        );
      case episodeSearchScreenRoute:
        return MaterialPageRoute(builder: (_) => EpisodeSearchScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Страница не существует'),
            ),
          ),
        );
    }
  }
}
