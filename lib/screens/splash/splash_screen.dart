import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void loadingDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        RouteGenerator.mainScreenRoute,
        arguments: 0,
      );
    });
  }

  @override
  void initState() {

    BlocProvider.of<CharactersListBloc>(context)
      ..isFetching = true
      ..add(CharactersListLoadEvent());
    BlocProvider.of<CharactersCountBloc>(context)
      .add(CharactersCountLoadEvent());
    BlocProvider.of<LocationsListBloc>(context)
      ..isFetching = true
      ..add(LocationsListLoadEvent());
    BlocProvider.of<LocationsCountBloc>(context)
      .add(LocationsCountLoadEvent());
    BlocProvider.of<EpisodesListBloc>(context).add(EpisodesListLoadEvent());
    loadingDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.nativeSplashImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        Images.rickImage,
                      ),
                      height: MediaQuery.of(context).size.height * 0.24,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.24,
                      child: Stack(
                        children: [
                          Container(),
                          Image.asset(
                            Images.mortyImage,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                Images.andImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.loose,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.24,
                          child: Image.asset(Images.downImage)),
                      Positioned(
                        bottom: 150,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.24,
                            child: Image.asset(Images.upImage)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
