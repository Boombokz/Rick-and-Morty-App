import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_details/blocs/episode_characters_bloc/episodes_character_bloc.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/character_screens/character_details/blocs/character_episodes_bloc/character_episodes_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_controller.dart'
    as globals;

class EpisodesList extends StatelessWidget {
  const EpisodesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Episodes',
                  style: Theme.of(context).textTheme.headline3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('MainScreen'));
                    globals.tabController.animateTo(2);
                  },
                  child: Text(
                    'All episodes',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: BlocBuilder<CharacterEpisodesBloc, CharacterEpisodesState>(
              builder: (context, state) {
                if (state is CharacterEpisodesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CharacterEpisodesLoadedState) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.episodes.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              BlocProvider.of<EpisodesCharacterBloc>(context)
                                .add(
                                  EpisodesCharacterLoadEvent(
                                    linkedCharactersURLs:
                                        state.episodes[index].characters ?? [],
                                  ),
                                );
                              Navigator.pushNamed(context,
                                  RouteGenerator.episodesDetailsScreenRoute,
                                  arguments: state.episodes[index]);
                            },
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
                                      color: ColorPalette.whiteColor
                                          .withOpacity(0.65),
                                    ),
                                    child: Image.asset(
                                      Images.episodeDetailsImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Episode ${state.episodes[index].id}'
                                            .toUpperCase(),
                                        style:
                                            TextStyles.statusTextStyle.copyWith(
                                          color: ColorPalette.lightBlueColor
                                              .withOpacity(0.87),
                                        ),
                                      ),
                                      Text(
                                        '${state.episodes[index].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                      Text(
                                        '${state.episodes[index].airDate}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              color: ColorPalette.greyColor
                                                  .withOpacity(0.6),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(IconsRes.arrowRightIcon),
                              ],
                            ),
                          ),
                        );
                      });
                } else if (state is CharacterEpisodesErrorState) {
                  return const Center(
                    child: Text('ERROR'),
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
