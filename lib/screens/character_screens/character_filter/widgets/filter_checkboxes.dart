import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_filter/widgets/custom_checkbox.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';

class FilterCheckboxes extends StatelessWidget {
  final String mainTitle;
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;

  const FilterCheckboxes(
      {Key? key, required this.mainTitle,
      required this.firstTitle,
      required this.secondTitle,
      required this.thirdTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DividerWidget(verticalPadding: 36, horizontalPadding: 0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            mainTitle.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: firstTitle,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: secondTitle,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomCheckbox(
            title: thirdTitle,
          ),
        ),
      ],
    );
  }
}
