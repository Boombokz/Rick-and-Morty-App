import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/episodes_list.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/images_stack.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/location_widgets.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character selectedCharacter;

  CharacterDetailsScreen({required this.selectedCharacter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesStack(
              imageURL: selectedCharacter.image,
            ),
            SizedBox(height: 90),
            Center(
              child: Text(
                '${selectedCharacter.name}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Center(
              child: Text(
                '${selectedCharacter.status}'.toUpperCase(),
                style: DefineTextStyle.statusTextStyle(
                    selectedCharacter.status),
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CharacterProperties(
                      title: 'Gender',
                      text: selectedCharacter.gender,
                    ),
                  ),
                  Expanded(
                    child: CharacterProperties(
                      title: 'Race',
                      text: selectedCharacter.species,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            LocationWidget(
              originName: selectedCharacter.origin.name,
              title: 'Origin location',
              function: () {
                // BlocProvider.of<LocationsCharacterBloc>(context)
                //   ..add(LocationsCharacterLoadEvent(
                //       linkedCharactersURLs:
                //       ));
                // Navigator.pushNamed(
                //   context,
                //   RouteGenerator.locationDetailsScreenRoute,
                //   arguments: (LocationsNetworkService().getLocations(
                //     parseLocation(widget.selectedCharacter.location.url),
                //   ))
                // );
              },
            ),
            SizedBox(height: 24),
            LocationWidget(
              originName: selectedCharacter.location.name,
              title: 'Location',
              function: () {},
            ),
            DividerWidget(verticalPadding: 36, horizontalPadding: 0),
            EpisodesList(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
