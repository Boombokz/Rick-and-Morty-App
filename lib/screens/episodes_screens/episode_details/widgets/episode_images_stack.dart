import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';

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
        Positioned(
          top: 54,
          left: 16,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.screenBackgroundColor),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 19, horizontal: 17),
                child: SvgPicture.asset(IconsRes.arrowBackIcon),
              ),
            ),
          ),
        ),
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
