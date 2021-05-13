import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/widgets/character_properties.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget(
      {required this.originName, required this.title, required this.function});

  final String originName;
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CharacterProperties(
              title: title,
              text: originName,
            ),
            SvgPicture.asset(IconsRes.arrowRightIcon),
          ],
        ),
      ),
    );
  }
}
