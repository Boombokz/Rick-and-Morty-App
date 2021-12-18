import 'package:flutter/material.dart';

class CharacterProperties extends StatelessWidget {
  final String title;
  final String text;

  const CharacterProperties({Key? key, required this.title, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 2.3),
        Text(
          text,
          style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ],
    );
  }
}
