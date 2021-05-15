import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/data/models/characters/character_model.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/episodes_list.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/images_stack.dart';
import 'package:rick_and_morty_test/utils/check_text_color/define_textstyle.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character selectedCharacter;

  CharacterDetailsScreen({required this.selectedCharacter});

  @override
  Widget build(BuildContext context) {
    print(selectedCharacter.origin.url.split('/').last);
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
                style:
                    DefineTextStyle.statusTextStyle(selectedCharacter.status),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (selectedCharacter.origin.url != '') {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterProperties(
                      title: 'Origin location',
                      text: selectedCharacter.origin.name,
                    ),
                    selectedCharacter.origin.url == ''
                        ? Offstage()
                        : SvgPicture.asset(
                            IconsRes.arrowRightIcon,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (selectedCharacter.location.url != '') {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterProperties(
                      title: 'Location',
                      text: selectedCharacter.location.name,
                    ),
                    selectedCharacter.location.url == ''
                        ? Offstage()
                        : SvgPicture.asset(
                            IconsRes.arrowRightIcon,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                  ],
                ),
              ),
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
