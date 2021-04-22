import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/models/character_model.dart';
import 'package:rick_and_morty_test/pages/character_details_page.dart';
import 'package:rick_and_morty_test/styles.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;

  CharacterListTile({required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterDetailsPage(
                      character: character,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: listTileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    height: 60,
                    width: 60,
                    image: NetworkImage(character.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(width: 13.5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${character.name}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      height: 1.47,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              color: greenCircleColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${character.status} - ${character.species}',
                            style: listTileStyle,
                          ),
                        ],
                      ),
                      Text(
                        '${character.gender}',
                        style: listTileStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
