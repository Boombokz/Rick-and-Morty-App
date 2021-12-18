import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class SearchCard extends StatelessWidget {
  final String hintText;
  final VoidCallback onFilterTap;
  final VoidCallback onTextTap;

  const SearchCard(
      {Key? key, required this.hintText,
      required this.onTextTap,
      required this.onFilterTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(IconsRes.searchIcon, color: Theme.of(context).iconTheme.color,),
          const SizedBox(width: 14),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTextTap,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 160,
              alignment: Alignment.centerLeft,
              child: Text(
                hintText,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          // Container(
          //   height: 24,
          //   child: VerticalDivider(
          //     thickness: 1,
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          // ),
          // InkWell(
          //   onTap: onFilterTap,
          //   child: SvgPicture.asset(IconsRes.filterIcon, color: Theme.of(context).iconTheme.color,),
          // ),
        ],
      ),
    );
  }
}
