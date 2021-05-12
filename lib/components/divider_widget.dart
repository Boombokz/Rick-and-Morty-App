import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';

class DividerWidget extends StatelessWidget {

  final double padding;

  DividerWidget({required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Divider(
        thickness: 2,
        indent: 16,
        endIndent: 16,
        color: ColorPalette.greyBackgroundColor,
      ),
    );
  }
}
