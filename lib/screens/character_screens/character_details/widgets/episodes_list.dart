import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/icons_res.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';

class EpisodesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Episodes',
                style: TextStyles.headerTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteGenerator.mainScreenRoute,
                    arguments: 2,
                  );
                },
                child: Text(
                  'All episodes',
                  style: TextStyles.greyTextStyle,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<CharactersEpisodeBloc, EpisodesCharacterState>(
          builder: (context, state) {
            if (state is EpisodesCharacterLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EpisodesCharacterLoadedState) {
              return Container(
                height: 500,
                child: ListView.builder(
                    itemCount: state.episodes.length,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 74,
                                  height: 74,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        ColorPalette.whiteColor.withOpacity(0.65),
                                  ),
                                  child: Image.asset(Images.episodeDetailsImage, fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Episode ${state.episodes[index].id}'
                                          .toUpperCase(),
                                      style: TextStyles.characterStatusStyle
                                          .copyWith(
                                        color: ColorPalette.lightBlueColor
                                            .withOpacity(0.87),
                                      ),
                                    ),
                                    Text(
                                      '${state.episodes[index].name}',
                                      style: TextStyles.characterNameStyle
                                          .copyWith(
                                        color: ColorPalette.whiteColor
                                            .withOpacity(0.87),
                                      ),
                                    ),
                                    Text(
                                      '${state.episodes[index].air_date}',
                                      style: TextStyles.greyTextStyle.copyWith(
                                          color: ColorPalette.greyColor),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(IconsRes.arrowRightIcon),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is EpisodesCharacterErrorState) {
              return Center(
                child: Text('ERROR'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ],
    );
  }
}
