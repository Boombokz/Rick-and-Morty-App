import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

class CharacterProperties extends StatelessWidget {
  final String title;
  final String text;

  CharacterProperties({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 2.3),
          Text(
            '$text',
            style: Theme.of(context).textTheme.overline,
          ),
        ],
      ),
    );
  }
}
