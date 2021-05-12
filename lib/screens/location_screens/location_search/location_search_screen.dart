import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/resources/images.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/locations_listview.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/blocs/location_search_bloc/location_search_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/widgets/search_location_widget.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_search/widgets/search_locations_listview.dart';

class LocationSearchScreen extends StatelessWidget {
  final List<Location> _searchedLocations = [];

  void clearSearchedLocations() {
    _searchedLocations.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.splashScreenColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchLocationWidget(
                clearSearchedLocations: clearSearchedLocations,
              ),
              SizedBox(height: 23),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Search results'.toUpperCase(),
                  style: TextStyles.charactersTextStyle,
                ),
              ),
              BlocBuilder<LocationSearchBloc, LocationSearchState>(
                builder: (context, state) {
                  if (state is LocationSearchLoadingState &&
                      _searchedLocations.isEmpty) {
                    return Center(child: CircularProgressIndicator());
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
                          style: TextStyles.searchScreenTextStyle,
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
                          SizedBox(height: 59),
                          Image.asset(Images.locationSearchErrorImage),
                          SizedBox(height: 28),
                          Text(
                            'Location with this name',
                            style: TextStyles.searchScreenTextStyle,
                          ),
                          Text(
                            'was not found',
                            style: TextStyles.searchScreenTextStyle,
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
