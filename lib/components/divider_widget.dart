import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double verticalPadding;
  final double horizontalPadding;

  DividerWidget(
      {required this.verticalPadding, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Divider(
        indent: horizontalPadding,
        endIndent: horizontalPadding,
      ),
    );
  }
}
