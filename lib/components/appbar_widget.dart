import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final bool backButton;

  AppBarWidget({required this.title, required this.backButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFFa3a3a3),
              ))
          : Offstage(),
      title: Text(
        title,
        style: TextStyles.appBarStyle,
      ),
      backgroundColor: ColorPalette.listTileBackgroundColor,
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.dark,
    );
  }
}
