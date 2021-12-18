import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double verticalPadding;
  final double horizontalPadding;

  const DividerWidget(
      {Key? key,  required this.verticalPadding, required this.horizontalPadding}): super(key: key);

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
