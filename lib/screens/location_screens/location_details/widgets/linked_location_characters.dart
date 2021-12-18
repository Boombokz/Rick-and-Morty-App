import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/locations_character_bloc/locations_character_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/linked_location_character_listtile.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;

class LinkedLocationCharacters extends StatelessWidget {
  const LinkedLocationCharacters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
          Flexible(
            child: BlocBuilder<LocationsCharacterBloc, LocationsCharacterState>(
              builder: (context, state) {
                if (state is LocationsCharacterLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LocationsCharacterLoadedState) {
                  return state.linkedCharacters.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.linkedCharacters.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          itemBuilder: (context, index) {
                            return LinkedLocationCharacterListTile(
                                character: state.linkedCharacters[index]);
                          })
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child:  Text(
                              'There is no residents',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        );
                } else if (state is LocationsCharacterErrorState) {
                  return const Center(
                    child: Text('ERROR'),
                  );
                } else {
                  return const Offstage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
