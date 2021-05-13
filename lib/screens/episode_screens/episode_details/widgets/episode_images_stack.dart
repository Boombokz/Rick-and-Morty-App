import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_arrow_button.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';


class EpisodeImagesStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.episodeDetailsImage,
            fit: BoxFit.cover,
          ),
        ),
        BackArrowButton(),
        Positioned(
          bottom: -20,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                color: ColorPalette.screenBackgroundColor),
          ),
        ),
        Positioned(
          bottom: -20,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 99,
              width: 99,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorPalette.lightBlueColor),
              child: Icon(
                Icons.play_arrow_rounded,
                color: ColorPalette.whiteColor,
                size: 64,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
