import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/styles.dart';

class CharacterProperties extends StatelessWidget {
  final String title;
  final String text;

  CharacterProperties({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: listTileStyle,
          ),
          SizedBox(height: 2.3),
          Text(
            '$text',
            style: appBarStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
