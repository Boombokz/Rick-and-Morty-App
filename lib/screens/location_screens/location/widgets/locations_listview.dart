import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/location_listtile.dart';

class LocationsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return LocationListTile();
    });
  }
}
