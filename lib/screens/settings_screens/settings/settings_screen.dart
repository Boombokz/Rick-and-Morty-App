import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:rick_and_morty_test/components/divider_widget.dart';
import 'package:rick_and_morty_test/global_bloc/theme_change_bloc/theme_change_bloc.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/main_theme.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

enum ThemeChoice { disabled, enabled, system, powersafe }

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeChoice? _choice = ThemeChoice.enabled;
  String themeStatus = 'Enabled';

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

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
            '$subtitle',
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                insetPadding: EdgeInsets.all(0),
                contentPadding: EdgeInsets.all(0),
                titlePadding:
                    EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 16),
                buttonPadding: EdgeInsets.zero,
                backgroundColor: Theme.of(context).primaryColor,
                title: Text(
                  'Dark theme',
                  style: TextStyles.headline3,
                ),
                content: Container(
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Disabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context)
                            ..add(ThemeChangeStartEvent(
                                themeMode: ThemeMode.light));
                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarIconBrightness: Brightness.dark,
                            statusBarBrightness: Brightness.dark,
                          ));
                        },
                      ),
                      RadioListTile<ThemeChoice>(
                        title: Text(
                          'Enabled',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        activeColor: ColorPalette.lightBlueColor,
                        value: ThemeChoice.enabled,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Enabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context)
                            ..add(ThemeChangeStartEvent(
                                themeMode: ThemeMode.dark));
                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarIconBrightness: Brightness.light,
                            statusBarBrightness: Brightness.light,
                          ));
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Enabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context)
                            ..add(ThemeChangeStartEvent(
                                themeMode: ThemeMode.system));
                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarIconBrightness: MediaQuery.of(context).platformBrightness != Brightness.light ? Brightness.light : Brightness.dark,
                            statusBarBrightness: MediaQuery.of(context).platformBrightness != Brightness.light ? Brightness.light : Brightness.dark,
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        groupValue: _choice,
                        dense: true,
                        onChanged: (ThemeChoice? value) {
                          setState(() {
                            _choice = value;
                            themeStatus = 'Enabled';
                          });
                          BlocProvider.of<ThemeChangeBloc>(context)
                            ..add(ThemeChangeStartEvent(
                                themeMode: ThemeMode.dark));
                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarIconBrightness: Brightness.light,
                            statusBarBrightness: Brightness.light,
                          ));
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20)),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Container(
                    //   width: 48,
                    //   height: 48,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: ColorPalette.greyBlueColor),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         globals.tabController.animateTo(0);
                    //       });
                    //     },
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 18, horizontal: 16),
                    //       child: SvgPicture.asset(IconsRes.arrowBackIcon),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: 30),
                    Spacer(),
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 36),
                Text(
                  'Appearance'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 24),
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
                      SizedBox(width: 16),
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
                              '$themeStatus',
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
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'About the app'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 24),
                Text(
                  'An app based on the television show Rick and Morty, where you can access information on their characters and in which episodes they have participated.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 24),
                Text(
                  'Illustrating Flutter development only.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'Copyright'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 24),
                Text(
                  'Rick and Morty is created by Justin Roiland and Dan Harmon for Adult Swim. The data and images are used without claim of ownership and belong to their respective owners.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 24),
                Text(
                  'The Rick and Morty API is a RESTful development by Axel Fuhrmann',
                  style: Theme.of(context).textTheme.headline6,
                ),
                DividerWidget(
                  verticalPadding: 36,
                  horizontalPadding: 0,
                ),
                Text(
                  'App version'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    _infoTile('v', _packageInfo.version),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
