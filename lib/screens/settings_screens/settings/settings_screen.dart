import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/global_bloc/theme_change_bloc/theme_change_bloc.dart';

import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/themes.dart';

import 'package:url_launcher/url_launcher.dart';

enum ThemeChoice { disabled, enabled, system, powersafe }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
    required this.rateMyApp,
  }) : super(key: key);

  final RateMyApp rateMyApp;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeChoice? _choice = ThemeChoice.enabled;
  String themeStatus = 'Enabled';

  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return Expanded(
      child: Row(
        children: [
          Text(
            'Rick & Morty  $title',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  _showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                insetPadding: const EdgeInsets.all(0),
                contentPadding: const EdgeInsets.all(0),
                titlePadding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 16),
                buttonPadding: EdgeInsets.zero,
                backgroundColor: Theme.of(context).primaryColor,
                title: const Text(
                  'Dark theme',
                  style: TextStyles.headline3,
                ),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<ThemeChoice>(
                        title: Text(
                          'Disabled',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        activeColor: ColorPalette.lightBlueColor,
                        selectedTileColor: ColorPalette.lightBlueColor,
                        value: ThemeChoice.disabled,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Disabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context).add(
                              ThemeChangeStartEvent(
                                  themeMode: ThemeMode.light,
                                  navBarColor: ColorPalette.whiteColor));
                          SystemChrome.setSystemUIOverlayStyle(
                              const SystemUiOverlayStyle(
                                  statusBarIconBrightness: Brightness.dark,
                                  statusBarBrightness: Brightness.dark,
                                  systemNavigationBarIconBrightness:
                                      Brightness.dark));
                        },
                      ),
                      RadioListTile<ThemeChoice>(
                        title: Text(
                          'Enabled',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        activeColor: ColorPalette.lightBlueColor,
                        value: ThemeChoice.enabled,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Enabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context).add(
                              ThemeChangeStartEvent(
                                  themeMode: ThemeMode.dark,
                                  navBarColor: ColorPalette.greyBlueColor));
                          SystemChrome.setSystemUIOverlayStyle(
                              const SystemUiOverlayStyle(
                                  statusBarIconBrightness: Brightness.light,
                                  statusBarBrightness: Brightness.light,
                                  systemNavigationBarIconBrightness:
                                      Brightness.light));
                        },
                      ),
                      RadioListTile<ThemeChoice>(
                        title: Text(
                          'Follow the system settings',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        activeColor: ColorPalette.lightBlueColor,
                        value: ThemeChoice.system,
                        dense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Follow the system settings';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context).add(
                              ThemeChangeStartEvent(
                                  themeMode: ThemeMode.system,
                                  navBarColor: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? ColorPalette.whiteColor
                                      : ColorPalette.greyBlueColor));
                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarIconBrightness:
                                MediaQuery.of(context).platformBrightness !=
                                        Brightness.light
                                    ? Brightness.light
                                    : Brightness.dark,
                            statusBarBrightness:
                                MediaQuery.of(context).platformBrightness !=
                                        Brightness.light
                                    ? Brightness.light
                                    : Brightness.dark,
                            systemNavigationBarIconBrightness:
                                MediaQuery.of(context).platformBrightness !=
                                        Brightness.light
                                    ? Brightness.light
                                    : Brightness.dark,
                          ));
                        },
                      ),
                      RadioListTile<ThemeChoice>(
                        title: Text(
                          'Power-saving mode',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        activeColor: ColorPalette.lightBlueColor,
                        value: ThemeChoice.powersafe,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Power-saving mode';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context).add(
                              ThemeChangeStartEvent(
                                  themeMode: ThemeMode.dark,
                                  navBarColor: ColorPalette.greyBlueColor));
                          SystemChrome.setSystemUIOverlayStyle(
                              const SystemUiOverlayStyle(
                                  statusBarIconBrightness: Brightness.light,
                                  statusBarBrightness: Brightness.light,
                                  systemNavigationBarIconBrightness:
                                      Brightness.light));
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel'.toUpperCase(),
                            style: TextStyles.overline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                Text(
                  'Appearance'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _showSingleChoiceDialog(context);
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconsRes.themeRowIcon,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dark theme',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              themeStatus,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        IconsRes.arrowRightIcon,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ],
                  ),
                ),
                const DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.rateMyApp.showStarRateDialog(
                        context,
                        title: 'Rate This App',
                        message: 'Do you like this app? Please leave a rating',
                        starRatingOptions: const StarRatingOptions(initialRating: 4),
                        actionsBuilder: actionsBuilder,
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        ColorPalette.lightBlueColor,
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: ColorPalette.lightBlueColor,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      'Rate Us 5 Star',
                      style: TextStyles.headline1.copyWith(
                        color: ColorPalette.lightBlueColor,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                const DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'About the app'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 24),
                Text(
                  'An app based on the television show Rick and Morty, where you can access information on their characters and in which episodes they have participated.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 24),
                Text(
                  'Illustrating Flutter framework development only.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'Copyright'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 24),
                Text(
                  'Rick and Morty is created by Justin Roiland and Dan Harmon for Adult Swim. The data and images are used without claim of ownership and belong to their respective owners.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 24),
                Text(
                  'The Rick and Morty API is a RESTful development by Axel Fuhrmann',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () async {
                    try {
                      const url = 'https://rickandmortyapi.com/documentation';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    }
                  },
                  child: Text(
                    'Go to API Documentation',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.blueAccent),
                  ),
                ),
                const DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'App version'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _infoTile('v', _packageInfo?.version ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> actionsBuilder(
    BuildContext context,
    double? stars,
  ) {
    return stars == null
        ? [buildCancelButton()]
        : [
            buildOkButton(stars),
            buildCancelButton(),
          ];
  }

  Widget buildOkButton(double stars) => TextButton(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: ColorPalette.lightBlueColor,
              content: Text('Thanks for your feedback!'),
            ),
          );

          final launchAppSotre = stars >= 4;

          const event = RateMyAppEventType.rateButtonPressed;

          await widget.rateMyApp.callEvent(event);

          if (launchAppSotre) {
            widget.rateMyApp.launchStore();
          }

          Navigator.of(context).pop();
        },
        child: const Text('Ok'),
      );

  Widget buildCancelButton() =>
      RateMyAppNoButton(widget.rateMyApp, text: 'Cancel');
}
