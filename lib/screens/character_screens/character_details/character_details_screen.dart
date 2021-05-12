import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/characters/character_model.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/episodes_list.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/images_stack.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/location_widgets.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character selectedCharacter;

  CharacterDetailsScreen({required this.selectedCharacter});

  @override
  _CharacterDetailsScreenState createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesStack(
              imageURL: widget.selectedCharacter.image,
            ),
            SizedBox(height: 90),
            Center(
              child: Text(
                '${widget.selectedCharacter.name}',
                style: TextStyles.bigTextStyle,
              ),
            ),
            Center(
              child: Text(
                '${widget.selectedCharacter.status}'.toUpperCase(),
                style: DefineTextStyle.statusTextStyle(widget.selectedCharacter.status),
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
                      text: widget.selectedCharacter.gender,
                    ),
                  ),
                  Expanded(
                    child: CharacterProperties(
                      title: 'Race',
                      text: widget.selectedCharacter.species,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            LocationWidget(
              originName: widget.selectedCharacter.origin.name,
              title: 'Origin location',
              function: () {},
            ),
            SizedBox(height: 24),
            LocationWidget(
              originName: widget.selectedCharacter.location.name,
              title: 'Location',
              function: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36),
              child: Divider(
                thickness: 2,
                color: ColorPalette.greyBackgroundColor,
              ),
            ),
            EpisodesList(),
          ],
        ),
      ),
    );
  }
}
