import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

import 'package:rick_and_morty_test/theme/text_theme.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/widgets/search_location_widget.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/widgets/search_locations_listview.dart';

class LocationSearchScreen extends StatelessWidget {
  final List<Location> _searchedLocations = [];

  LocationSearchScreen({Key? key}) : super(key: key);

  void clearSearchedLocations() {
    _searchedLocations.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchLocationWidget(
                clearSearchedLocations: clearSearchedLocations,
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              BlocBuilder<LocationSearchBloc, LocationSearchState>(
                builder: (context, state) {
                  if (state is LocationSearchLoadingState &&
                      _searchedLocations.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LocationSearchInitial) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.2),
                      child: Center(
                        child: Text(
                          'Enter location\'s name',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    );
                  } else if (state is LocationSearchedState) {
                    _searchedLocations.addAll(state.searchedLocations);

                    BlocProvider
                        .of<LocationSearchBloc>(context)
                        .isFetching =
                    false;
                  } else if (state is LocationSearchErrorState &&
                      _searchedLocations.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 59),
                          Image.asset(Images.locationSearchErrorImage),
                          const SizedBox(height: 28),
                          const Text(
                            'Location with this name\nwas not found',
                            style: TextStyles.headline2,
                          ),
                  
                        ],
                      ),
                    );
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: SearchLocationsListView(
                                locations: _searchedLocations),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
