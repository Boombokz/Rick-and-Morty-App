import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

import 'package:rick_and_morty_test/constants/router/route_generator.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/screens/location_screens/location_details/blocs/location_details_bloc/location_details_bloc.dart';

class LocationListTile extends StatelessWidget {
  final Location location;

  const LocationListTile({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        BlocProvider.of<LocationDetailsBloc>(context)
          .add(
            LocationDetailsStartEvent(locationID: location.id ?? 0),
          );

        Navigator.pushNamed(context, RouteGenerator.locationDetailsScreenRoute);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 74,
                height: 74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent[100],
                ),
                child: Image.asset(
                  Images.locationDetailsImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 13.5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name ?? '',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${location.type} - ${location.dimension}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
