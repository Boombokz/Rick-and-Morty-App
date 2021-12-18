import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/episodes/episode_model.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/blocs/episodes_list_bloc/episode_list_bloc.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode/widgets/season_tab.dart';

import 'package:rick_and_morty_test/theme/themes.dart';

class SeasonsTabBar extends StatefulWidget {
  const SeasonsTabBar({Key? key}) : super(key: key);

  @override
  _SeasonsTabBarState createState() => _SeasonsTabBarState();
}

class _SeasonsTabBarState extends State<SeasonsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //Split episodes list to tabs
  Map<K, List<V>> groupBy<K, V>(List<V> values, K Function(V item) mappedBy) {
    final result = <K, List<V>>{};
    for (var v in values) {
      final key = mappedBy(v);
      if (!result.containsKey(key)) {
        result[key] = <V>[];
      }
      result[key]!.add(v);
    }
    return result;
  }

  final List<Widget> _tabs = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 1".toUpperCase(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 2".toUpperCase(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 3".toUpperCase(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 4".toUpperCase(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        "Season 5".toUpperCase(),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 38),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: TabBar(
                indicatorColor: Theme.of(context).colorScheme.onSecondary,
                labelPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is EpisodesListLoadedState) {
                  Map<String, List<Episode>> seasonsEpisodes =
                      groupBy<String, Episode>(state.loadedEpisodes,
                          (e) => (e.episode)?.substring(0, 3) ?? '');
                  return  TabBarView(
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
                      SeasonTab(
                        loadedEpisodes: seasonsEpisodes['S05']!,
                      ),
                    ],
                  );
                  
                } else if (state is EpisodesListLoadErrorState) {
                  return Center(
                    child: Text(
                      'Error'.toUpperCase(),
                      style: TextStyles.bodyText2,
                    ),
                  );
                } else {
                  return const Offstage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
