import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class FilterTypeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const FilterTypeItem(
      {Key? key, required this.title, required this.subtitle, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.caption),

                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.headline5),

              ],
            ),
            SvgPicture.asset(IconsRes.arrowRightIcon,color: Theme.of(context).colorScheme.onSecondary,),
          ],
        ),
      ),
    );
  }
}
