import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/widgets/appbar_widget.dart';
import 'package:rick_and_morty_test/widgets/character_properties.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  CharacterDetailsPage({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarWidget(
        title: '${character.name}',
        backButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Color(0xFFE4E4E4).withOpacity(0.20), width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 177,
                    height: 177,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      height: 175,
                      width: 175,
                      image: NetworkImage(character.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    color: greenCircleColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${character.status} - ${character.species}',
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(height: 33),
              ],
            ),
            SizedBox(height: 33),
            CharacterProperties(
              title: 'Origin location',
              text: character.origin.name,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 36,
              ),
              child: Divider(
                height: 0.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            CharacterProperties(
              title: 'Gender',
              text: character.gender,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 36,
              ),
              child: Divider(
                height: 0.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            CharacterProperties(
              title: 'Location',
              text: character.location.name,
            ),
          ],
        ),
      ),
    );
  }
}
