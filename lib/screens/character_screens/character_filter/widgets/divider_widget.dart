import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';

class DividerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36),
      child: Divider(
        thickness: 2,
        indent: 16,
        endIndent: 16,
        color: ColorPalette.greyBackgroundColor,
      ),
    );
  }
}
