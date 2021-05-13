import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/location_listtile.dart';

class LocationsListView extends StatelessWidget {
  final List<Location> locations;

  LocationsListView({required this.locations});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                !context.read<LocationsListBloc>().isFetching) {
              context.read<LocationsListBloc>()..add(LocationsListLoadEvent());
              context.read<LocationsListBloc>()..isFetching = true;
            }
          }),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shrinkWrap: true,
        itemCount: locations.length +
            (context.read<LocationsListBloc>().isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < locations.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: LocationListTile(
                location: locations[index],
              ),
            );
          } else {
            Timer(Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });

            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
