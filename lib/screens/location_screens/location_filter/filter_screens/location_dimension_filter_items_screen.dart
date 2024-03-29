import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_icon_button.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/data/repository/dimensions_repository.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

class LocationDimensionFilterItemsScreen extends StatefulWidget {
  const LocationDimensionFilterItemsScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 60,
              padding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 15),
              color: Theme.of(context).colorScheme.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const BackIconButton(),
                      const SizedBox(width: 12),
                      Text(
                        'Select dimension',
                        style: Theme.of(context).textTheme.headline3,
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  currentIndex = -1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Not selected',
                      style: currentIndex == -1
                          ? Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: ColorPalette.lightBlueColor)
                          : Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            const DividerWidget(
              verticalPadding: 24,
              horizontalPadding: 16,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
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
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(dimensionsRepository.getTypes()[index],
                            style: currentIndex == index
                                ? Theme.of(context).textTheme.caption!.copyWith(
                                    color: ColorPalette.lightBlueColor)
                                : Theme.of(context).textTheme.caption),
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
