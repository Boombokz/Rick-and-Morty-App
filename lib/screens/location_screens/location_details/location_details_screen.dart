import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/image_stack.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/widgets/linked_location_characters.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Location selectedLocation;

  LocationDetailsScreen({required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStack(),

            Center(
              child: Text(
                '${selectedLocation.name}',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CharacterProperties(
                title: 'Type',
                text: selectedLocation.type,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CharacterProperties(
                title: 'Dimension',
                text: selectedLocation.dimension,
              ),
            ),
            DividerWidget(verticalPadding: 36, horizontalPadding: 0,),
            LinkedLocationCharacters(),
          ],
        ),
      ),
    );
  }
}
