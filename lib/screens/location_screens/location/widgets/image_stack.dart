import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';

class ImageStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.locationDetailsImage,
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
      ],
    );
  }
}
