import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/back_icon_button.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/data/repository/types_repository.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

class LocationTypeFilterItemsScreen extends StatefulWidget {
  const LocationTypeFilterItemsScreen({Key? key}) : super(key: key);

  @override
  _LocationTypeFilterItemsScreenState createState() =>
      _LocationTypeFilterItemsScreenState();
}

class _LocationTypeFilterItemsScreenState
    extends State<LocationTypeFilterItemsScreen> {
  final TypesRepository typesRepository = TypesRepository();

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
                        'Select type',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
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
                  itemCount: typesRepository.getTypes().length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          typesRepository.getTypes()[index],
                          style: currentIndex == index
                              ? Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: ColorPalette.lightBlueColor)
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
