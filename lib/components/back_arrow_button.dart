import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 54,
      left: 16,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).primaryColor),
        child: IconButton(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          icon: SvgPicture.asset(
            IconsRes.arrowBackIcon,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
