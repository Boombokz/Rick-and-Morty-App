import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';

import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/linked_location_character_listtile.dart';

class LinkedLocationCharacters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Characters',
                style: TextStyles.headerTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteGenerator.mainScreenRoute,
                    arguments: 0,
                  );
                },
                child: Text(
                  'All characters',
                  style: TextStyles.greyTextStyle,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<LocationsCharacterBloc, LocationsCharacterState>(
          builder: (context, state) {
            if (state is LocationsCharacterLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LocationsCharacterLoadedState) {
              return Container(
                height: 500,
                child: ListView.builder(
                    itemCount: state.linkedCharacters.length,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      return LinkedLocationCharacterListTile(
                          character: state.linkedCharacters[index]);
                    }),
              );
            } else if (state is LocationsCharacterErrorState) {
              return Center(
                child: Text('ERROR'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ],
    );
  }
}
