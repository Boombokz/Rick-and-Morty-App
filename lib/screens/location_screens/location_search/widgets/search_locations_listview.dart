import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/location_listtile.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';
import 'package:rick_and_morty_test/utils/global_state/global_state.dart';

class SearchLocationsListView extends StatelessWidget {
  final List<Location> locations;
  final ScrollController _scrollController = ScrollController();

  SearchLocationsListView({Key? key, required this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                BlocProvider.of<LocationSearchBloc>(context).isFetching ==
                    false) {
              BlocProvider.of<LocationSearchBloc>(context)
                ..isFirstTime = false
                ..add(LocationSearchStartEvent(
                    text: store.get('locationSearchText')));
              BlocProvider.of<LocationSearchBloc>(context).isFetching = true;
            }
          }),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: locations.length +
            (BlocProvider.of<LocationSearchBloc>(context).isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < locations.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: LocationListTile(
                location: locations[index],
              ),
            );
          } else {
            Timer(const Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
