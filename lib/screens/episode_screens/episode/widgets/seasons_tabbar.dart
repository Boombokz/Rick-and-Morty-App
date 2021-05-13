import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/season_tab.dart';

import 'package:rick_and_morty_test/theme/themes.dart';

class SeasonsTabBar extends StatefulWidget {
  @override
  _SeasonsTabBarState createState() => _SeasonsTabBarState();
}

class _SeasonsTabBarState extends State<SeasonsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Map<K, List<V>> groupBy<K, V>(List<V> values, K mappedBy(V item)) {
    final result = <K, List<V>>{};
    values.forEach((v) {
      final key = mappedBy(v);
      if (!result.containsKey(key)) {
        result[key] = <V>[];
      }
      result[key]!.add(v);
    });
    return result;
  }

  List<Widget> _tabs = [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 1".toUpperCase(),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 2".toUpperCase(),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 3".toUpperCase(),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 4".toUpperCase(),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxHeight: 38),
            child: Material(
              color: ColorPalette.darkBlueColor,
              child: TabBar(
                unselectedLabelColor: ColorPalette.darkGreyColor,
                indicatorColor: ColorPalette.whiteColor,
                labelPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                isScrollable: true,
                tabs: _tabs,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<EpisodesListBloc, EpisodesListState>(
              builder: (context, state) {
                if (state is EpisodesListLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is EpisodesListLoadedState) {
                  Map<String, List<Episode>> seasonsEpisodes =
                      groupBy<String, Episode>(state.loadedEpisodes,
                          (e) => (e.episode).substring(0, 3));

                  return TabBarView(
                    controller: _tabController,
                    children: [
                      SeasonTab(
                        loadedEpisodes: seasonsEpisodes['S01']!,
                      ),
                      SeasonTab(
                        loadedEpisodes: seasonsEpisodes['S02']!,
                      ),
                      SeasonTab(
                        loadedEpisodes: seasonsEpisodes['S03']!,
                      ),
                      SeasonTab(
                        loadedEpisodes: seasonsEpisodes['S04']!,
                      ),
                    ],
                  );
                } else if (state is EpisodesListLoadErrorState) {
                  return Center(
                    child: Text(
                      'Error'.toUpperCase(),
                      style: TextStyles.charactersTextStyle,
                    ),
                  );
                } else {
                  return Offstage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
