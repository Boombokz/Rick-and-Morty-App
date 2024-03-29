import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_arrow_button.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.locationDetailsImage,
            fit: BoxFit.cover,
          ),
        ),
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
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )),
        const BackArrowButton(),
      ],
    );
  }
}
