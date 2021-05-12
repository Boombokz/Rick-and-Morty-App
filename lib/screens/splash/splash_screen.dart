import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_count_bloc/characters_count_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_list_bloc/characters_list_bloc.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void loadingDelay(context) {
    Future.delayed(Duration(seconds: 3), () {
       Navigator.pushReplacementNamed(context, RouteGenerator.mainScreenRoute,
          arguments: 0);
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCountBloc>(context)
        ..add(CharactersCountLoadEvent());
    BlocProvider.of<LocationsListBloc>(context)..add(LocationsListLoadEvent());
    BlocProvider.of<LocationsCountBloc>(context)..add(LocationsCountLoadEvent());
    BlocProvider.of<EpisodesListBloc>(context)..add(EpisodesListLoadEvent());

    loadingDelay(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.splashScreenColor,
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
                    Container(
                      child: Image.asset(
                        Images.rickImage,
                      ),
                      height: MediaQuery.of(context).size.height * 0.24,
                    ),
                    Container(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.loose,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.24,
                          child: Image.asset(Images.downImage)),
                      Positioned(
                        bottom: 150,
                        child: Container(
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
