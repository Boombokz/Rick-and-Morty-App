import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/components/search_card.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';
import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/theme/text_theme.dart';

import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/locations_listview.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';

class LocationScreen extends StatelessWidget {
  final List<Location> _locations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 16,
              left: 16,
            ),
            child: SearchCard(
              hintText: 'Find location',
              onTextTap: () {
                BlocProvider.of<LocationSearchBloc>(context)
                    .add(LocationSearchInitialEvent());
                Navigator.pushNamed(
                    context, RouteGenerator.locationSearchScreenRoute);
              },
              onFilterTap: () {
                Navigator.pushNamed(
                    context, RouteGenerator.locationFilterScreenRoute);
              },
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<LocationsCountBloc, LocationsCountState>(
                  builder: (context, state) {
                    if (state is LocationsCountLoadedState) {
                      return Text(
                        'Total locations: ${state.totalCount}'.toUpperCase(),
                        style: TextStyles.genderTextStyle,
                      );
                    } else if (state is LocationsCountLoadingState) {
                      return Offstage();
                    } else if (state is LocationsCountErrorState) {
                      return Text(
                        'Error'.toUpperCase(),
                        style: TextStyles.genderTextStyle,
                      );
                    } else {
                      return Offstage();
                    }
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<LocationsListBloc, LocationsListState>(
            builder: (context, state) {
              if (state is LocationsListLoadingState && _locations.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LocationsListLoadedState) {
                _locations.addAll((state.loadedLocations)
                    .where((e) => !_locations.contains(e)));
                context.read<LocationsListBloc>()..isFetching = false;
              } else if (state is LocationsListLoadErrorState &&
                  _locations.isEmpty) {
                return Center(
                  child: Text('Error'),
                );
              }
              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: LocationsListView(
                        locations: _locations,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
