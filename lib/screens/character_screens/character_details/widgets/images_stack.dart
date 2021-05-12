import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';

class ImagesStack extends StatelessWidget {
  final String imageURL;

  ImagesStack({required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.88),
                        ColorPalette.splashScreenColor.withOpacity(0.65),
                        ColorPalette.splashScreenColor.withOpacity(0.65),
                        ColorPalette.splashScreenColor.withOpacity(0.65),
                      ]),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -66,
          left: 50,
          right: 50,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                  width: 8,
                  color: ColorPalette.screenBackgroundColor,
                  style: BorderStyle.solid,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  height: 146,
                  width: 146,
                  image: NetworkImage(imageURL),
                  fit: BoxFit.fill,
                ),
              ),
            ),
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
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                child: SvgPicture.asset(
                  IconsRes.arrowBackIcon,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
