import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/location_details_bloc/location_details_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/image_stack.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/linked_location_characters.dart';

class LocationDetailsScreen extends StatefulWidget {
  @override
  _LocationDetailsScreenState createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStack(),
            BlocBuilder<LocationDetailsBloc, LocationDetailsState>(
              builder: (context, state) {
                if (state is LocationDetailsLoadingState) {
                  return Container(height: 170);
                } else if (state is LocationDetailsLoadState) {
                  BlocProvider.of<LocationsCharacterBloc>(context)
                    ..add(
                      LocationsCharacterLoadEvent(
                          linkedCharactersURLs: state.location.residents),
                    );
                  controller.forward();
                  return FadeTransition(
                    opacity: animation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            '${state.location.name}',
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 36),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CharacterProperties(
                            title: 'Type',
                            text: state.location.type,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CharacterProperties(
                            title: 'Dimension',
                            text: state.location.dimension,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is LocationDetailsErrorState) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Offstage();
                }
              },
            ),
            DividerWidget(
              verticalPadding: 36,
              horizontalPadding: 0,
            ),
            LinkedLocationCharacters(),
          ],
        ),
      ),
    );
  }
}
