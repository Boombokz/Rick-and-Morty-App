import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/components/search_card.dart';
import 'package:rick_and_morty_test/constants/colors/colors.dart';
import 'package:rick_and_morty_test/constants/text_styles/text_styles.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_count_bloc/locations_count_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/blocs/locations_list_bloc/locations_list_bloc.dart';
import 'package:rick_and_morty_test/screens/location_screens/location/widgets/locations_listview.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackgroundColor,
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
              onTap: () {},
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
                        style: TextStyles.charactersTextStyle,
                      );
                    } else if (state is LocationsCountLoadingState) {
                      return Offstage();
                    } else if (state is LocationsCountErrorState) {
                      return Text(
                        'Error'.toUpperCase(),
                        style: TextStyles.charactersTextStyle,
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
              if (state is LocationsListLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LocationsListLoadedState) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: LocationsListView(),
                      ),
                    ],
                  ),
                );
              } else if (state is LocationsListLoadErrorState) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return Offstage();
              }
            },
          ),
        ],
      )),
    );
  }
}
