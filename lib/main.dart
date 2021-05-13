import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_change_view_bloc/character_change_view_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CharactersCountBloc()),
          BlocProvider(create: (context) => CharactersListBloc()),
          BlocProvider(create: (context) => CharacterEpisodesBloc()),
          BlocProvider(create: (context) => CharacterSearchBloc()),
          BlocProvider(create: (context) => LocationSearchBloc()),
          BlocProvider(create: (context) => LocationsCountBloc()),
          BlocProvider(create: (context) => LocationsListBloc()),
          BlocProvider(create: (context) => LocationsCharacterBloc()),
          BlocProvider(create: (context) => EpisodesListBloc()),
          BlocProvider(create: (context) => EpisodesCharacterBloc()),
          BlocProvider(create: (context) => EpisodeSearchBloc()),
          BlocProvider(create: (context) => CharacterChangeViewBloc()),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Roboto'),
          title: 'Rick and Morty',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteGenerator.splashScreenRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
