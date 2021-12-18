import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/global_bloc/theme_change_bloc/theme_change_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_change_view_bloc/character_change_view_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/location_details_bloc/location_details_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/theme/main_theme.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: ColorPalette.darkBlueColor,
  ));
  initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharactersCountBloc()),
        BlocProvider(create: (context) => CharactersListBloc()),
        BlocProvider(create: (context) => CharacterEpisodesBloc()),
        BlocProvider(create: (context) => CharacterSearchBloc()),
        BlocProvider(create: (context) => LocationSearchBloc()),
        BlocProvider(create: (context) => LocationsCountBloc()),
        BlocProvider(create: (context) => LocationsListBloc()),
        BlocProvider(create: (context) => LocationsCharacterBloc()),
        BlocProvider(create: (context) => LocationDetailsBloc()),
        BlocProvider(create: (context) => EpisodesListBloc()),
        BlocProvider(create: (context) => EpisodesCharacterBloc()),
        BlocProvider(create: (context) => EpisodeSearchBloc()),
        BlocProvider(create: (context) => CharacterChangeViewBloc()),
        BlocProvider(create: (context) => ThemeChangeBloc()),
      ],
      child: BlocBuilder<ThemeChangeBloc, ThemeChangeState>(
        builder: (context, state) {
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: state.navBarColor,
            ),
            child: MaterialApp(
              themeMode: state.themeMode,
              theme: MainThemes.lightTheme,
              darkTheme: MainThemes.darkTheme,
              title: 'Rick and Morty',
              debugShowCheckedModeBanner: false,
              initialRoute: RouteGenerator.splashScreenRoute,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
