import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/repository/dimensions_repository.dart';

class LocationDimensionFilterItemsScreen extends StatefulWidget {
  @override
  _LocationDimensionFilterItemsScreenState createState() =>
      _LocationDimensionFilterItemsScreenState();
}

class _LocationDimensionFilterItemsScreenState
    extends State<LocationDimensionFilterItemsScreen> {
  final DimensionsRepository dimensionsRepository = DimensionsRepository();

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.splashScreenColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              height: 60,
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 21, right: 15),
              color: ColorPalette.greyBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(IconsRes.arrowBackIcon),
                      ),
                      SizedBox(width: 25),
                      Text(
                        'Select type',
                        style: TextStyles.headerTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 36),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  currentIndex = -1;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Not selected',
                      style: TextStyles.searchScreenTextStyle.copyWith(
                          color: currentIndex == -1
                              ? ColorPalette.lightBlueColor
                              : ColorPalette.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
            DividerWidget(verticalPadding: 24, horizontalPadding: 0,),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 12, right: 16, left: 16),
                  shrinkWrap: true,
                  itemCount: dimensionsRepository.getTypes().length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          '${dimensionsRepository.getTypes()[index]}',
                          style: TextStyles.searchScreenTextStyle.copyWith(
                              color: currentIndex == index
                                  ? ColorPalette.lightBlueColor
                                  : ColorPalette.whiteColor),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
