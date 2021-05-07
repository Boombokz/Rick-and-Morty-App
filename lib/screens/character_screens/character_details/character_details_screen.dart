import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/episodes_list.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/images_stack.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/location_widgets.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character selectedCharacter;

  CharacterDetailsScreen({required this.selectedCharacter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Color(0xFFE4E4E4).withOpacity(0.20), width: 1),
          ),
        ),
        child: SingleChildScrollView(
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
                  style: TextStyles.bigTextStyle,
                ),
              ),
              Center(
                child: Text(
                  '${selectedCharacter.status}'.toUpperCase(),
                  style: TextStyles.characterStatusStyle,
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
                function: () {},
              ),
              SizedBox(height: 24),
              LocationWidget(
                originName: selectedCharacter.location.name,
                title: 'Location',
                function: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 36),
                child: Divider(
                  height: 2,
                  color: ColorPalette.greyBackgroundColor,
                ),
              ),
              EpisodesList(),
            ],
          ),
        ),
      ),
    );
  }
}
