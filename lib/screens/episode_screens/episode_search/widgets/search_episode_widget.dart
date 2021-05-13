import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/resources/resources.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/screens/episode_screens/episode_search/blocs/episode_search_bloc/episode_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchEpisodeWidget extends StatefulWidget {
  final VoidCallback clearSearchedEpisodes;

  SearchEpisodeWidget({
    required this.clearSearchedEpisodes,
  });

  @override
  _SearchEpisodeWidgetState createState() => _SearchEpisodeWidgetState();
}

class _SearchEpisodeWidgetState extends State<SearchEpisodeWidget> {
  TextEditingController textController = TextEditingController();

  String previousValue = '';
  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      isChanged = previousValue != textController.text;

      if (textController.text.isEmpty) {
        widget.clearSearchedEpisodes();
        BlocProvider.of<EpisodeSearchBloc>(context)
          ..add(EpisodeSearchInitialEvent());
        previousValue = '';
      } else if (isChanged) {
        BlocProvider.of<EpisodeSearchBloc>(context).page = 1;

        BlocProvider.of<EpisodeSearchBloc>(context)
          ..isFirstTime = true
          ..page = 1
          ..isFetching = true
          ..add(EpisodeSearchStartEvent(text: textController.text));
        store.set('episodeSearchText', textController.text);
        previousValue = textController.text;
      }
      widget.clearSearchedEpisodes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.greyBackgroundColor,
      padding: EdgeInsets.only(left: 21, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(IconsRes.arrowBackIcon),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 175,
            child: TextField(
              style: TextStyles.searchTextStyle
                  .copyWith(color: ColorPalette.whiteColor),
              autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Find character',
                hintStyle: TextStyles.searchTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              textController.clear();
              widget.clearSearchedEpisodes();
              BlocProvider.of<EpisodeSearchBloc>(context)
                  .add(EpisodeSearchInitialEvent());
            },
            child: SvgPicture.asset(IconsRes.cancelIcon),
          ),
        ],
      ),
    );
  }
}
