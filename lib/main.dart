import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/episodes_character/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_search/blocs/character_search_bloc/character_search_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharactersCountBloc()),
        BlocProvider(create: (context) => CharactersListBloc()),
        BlocProvider(create: (context) => EpisodesCharacterBloc()),
        BlocProvider(create: (context) => CharacterSearchBloc()),
        BlocProvider(create: (context) => LocationsCountBloc()..add(LocationsCountLoadEvent())),
        BlocProvider(
            create: (context) =>
                LocationsListBloc()..add(LocationsListLoadEvent())),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
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
