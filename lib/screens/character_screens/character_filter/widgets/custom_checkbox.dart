import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;

  const CustomCheckbox({Key? key, required this.title}) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: isChecked
              ? SvgPicture.asset(IconsRes.checkedIcon)
              : SvgPicture.asset(IconsRes.uncheckedIcon,color: Theme.of(context).colorScheme.primaryVariant,),
        ),
        const SizedBox(width: 16),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        )
      ],
    );
  }
}
