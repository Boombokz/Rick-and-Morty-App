import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_filter/widgets/custom_checkbox.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';

class FilterCheckboxes extends StatelessWidget {
  final String mainTitle;
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;

  FilterCheckboxes(
      {required this.mainTitle,
      required this.firstTitle,
      required this.secondTitle,
      required this.thirdTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerWidget(verticalPadding: 36, horizontalPadding: 0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$mainTitle'.toUpperCase(),
            style: TextStyles.charactersTextStyle,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: '$firstTitle',
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: '$secondTitle',
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: '$thirdTitle',
          ),
        ),
      ],
    );
  }
}
