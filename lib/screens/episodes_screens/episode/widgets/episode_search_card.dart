import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/episodes_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';

class EpisodeSearchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorPalette.greyBackgroundColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(IconsRes.searchIcon),
          SizedBox(width: 26),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              BlocProvider.of<EpisodeSearchBloc>(context)
                ..add(EpisodeSearchInitialEvent());
              Navigator.pushNamed(
                  context, RouteGenerator.episodeSearchScreenRoute);
            },
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 180,
              alignment: Alignment.centerLeft,
              child: Text(
                'Find episode',
                style: TextStyles.searchTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
