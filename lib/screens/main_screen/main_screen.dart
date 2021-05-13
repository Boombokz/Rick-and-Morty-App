import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character/character_screen.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode/episode_screen.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/location_screen.dart';
import 'package:rick_and_morty_test/screens/settings_screens/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    globals.tabController = _tabController;

    super.initState();
  }

  void onSelectTab(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabController.index,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyles.greyTextStyle,
        selectedLabelStyle: TextStyles.greyTextStyle,
        unselectedItemColor: ColorPalette.darkGreyColor,
        selectedItemColor: ColorPalette.greenTextColor,
        currentIndex: _tabController.index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.greyBackgroundColor,
        items: bottomNavBarItems,
        onTap: onSelectTab,
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(IconsRes.characterIconOff),
      activeIcon: SvgPicture.asset(IconsRes.characterIconOn),
      label: 'Characters',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(IconsRes.locationIconOff),
      activeIcon: SvgPicture.asset(IconsRes.locationIconOn),
      label: 'Locations',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(IconsRes.episodesIconOff),
      activeIcon: SvgPicture.asset(IconsRes.episodesIconOn),
      label: 'Episodes',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(IconsRes.settingsIconOff),
      activeIcon: SvgPicture.asset(IconsRes.settingsIconOn),
      label: 'Settings',
    ),
  ];

  final tabs = [
    CharacterScreen(),
    LocationScreen(),
    EpisodeScreen(),
    SettingsScreen(),
  ];
}
