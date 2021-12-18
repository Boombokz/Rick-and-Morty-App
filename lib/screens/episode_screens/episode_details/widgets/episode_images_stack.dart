import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_arrow_button.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

class EpisodeImagesStack extends StatelessWidget {
  const EpisodeImagesStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.episodeDetailsImage,
            fit: BoxFit.cover,
          ),
        ),
        const BackArrowButton(),
        Positioned(
          bottom: -20,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                color: Theme.of(context).scaffoldBackgroundColor),
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
                color: ColorPalette.lightBlueColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorPalette.blackColor.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: const Icon(
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
