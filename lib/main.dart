import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/blocs/character_bloc/character_bloc.dart';
import 'package:rick_and_morty_test/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/pages/home_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF3C3E44),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CharactersListBloc()..add(CharactersListLoadEvent()),
        ),
        BlocProvider(create: (context) => CharacterBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Display'),
        title: 'Rick and Morty',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
