import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_arrow_button.dart';
import 'package:rick_and_morty_test/resources/resources.dart';


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
        BackArrowButton(),
      ],
    );
  }
}
