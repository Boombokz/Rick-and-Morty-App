import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_filter/widgets/filter_type_item.dart';

class LocationFilterScreen extends StatefulWidget {
  @override
  _LocationFilterScreenState createState() => _LocationFilterScreenState();
}

class _LocationFilterScreenState extends State<LocationFilterScreen> {
  bool sortSelected = false;

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
                        'Filters',
                        style: TextStyles.headerTextStyle,
                      ),
                    ],
                  ),
                  sortSelected
                      ? InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(IconsRes.filterCancelIcon))
                      : Offstage(),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Sort'.toUpperCase(),
                style: TextStyles.charactersTextStyle,
              ),
            ),
            SizedBox(height: 29),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'By alphabet',
                    style: TextStyles.searchScreenTextStyle
                        .copyWith(color: ColorPalette.whiteColor),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          IconsRes.upSortIcon,
                          color: sortSelected
                              ? ColorPalette.darkGreyColor
                              : ColorPalette.lightBlueColor,
                        ),
                        onTap: () {
                          setState(() {
                            sortSelected = false;
                          });
                        },
                      ),
                      SizedBox(width: 32),
                      GestureDetector(
                        child: SvgPicture.asset(
                          IconsRes.downSortIcon,
                          color: sortSelected
                              ? ColorPalette.lightBlueColor
                              : ColorPalette.darkGreyColor,
                        ),
                        onTap: () {
                          setState(() {
                            sortSelected = true;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DividerWidget(verticalPadding: 36, horizontalPadding: 0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Filter by:'.toUpperCase(),
                style: TextStyles.charactersTextStyle,
              ),
            ),
            SizedBox(height: 36),
            FilterTypeItem(
              title: 'Type',
              subtitle: 'Select location type',
              onTap: () {
                Navigator.pushNamed(
                    context, RouteGenerator.locationTypeFilterItemsScreenRoute);
              },
            ),
            SizedBox(height: 36),
            FilterTypeItem(
              title: 'Dimension',
              subtitle: 'Select location dimension',
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteGenerator.dimensionTypeFilterItemsScreenRoute);
                },
            ),
          ],
        ),
      ),
    );
  }
}
