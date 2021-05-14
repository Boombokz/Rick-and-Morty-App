import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class BackIconButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(

      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pop(context);
      },
      splashRadius: 8,

      icon: SvgPicture.asset(
        IconsRes.arrowBackIcon,
        color: Theme.of(context).colorScheme.onSecondary,
        width: 20,

      ),
    );
  }
}
