import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/linked_location_character_listtile.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;

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
                'Residents',
                style: Theme.of(context).textTheme.headline3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('MainScreen'));
                  //this needs to prevent rebuild state on mainScreen
                  globals.tabController.animateTo(0);
                },
                child: Text(
                  'All characters',
                  style: Theme.of(context).textTheme.subtitle1,
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
              return state.linkedCharacters.length != 0
                  ? Container(
                      height: state.linkedCharacters.length >= 5 ? 500 : state.linkedCharacters.length * 100,
                      child: ListView.builder(
                          itemCount: state.linkedCharacters.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          itemBuilder: (context, index) {
                            return LinkedLocationCharacterListTile(
                                character: state.linkedCharacters[index]);
                          }),
                    )
                  : Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'There is no residents',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
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
