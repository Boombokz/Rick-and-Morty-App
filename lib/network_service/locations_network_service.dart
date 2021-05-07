import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/constants/network/network_url.dart';
import 'package:rick_and_morty_test/models/locations/location_model.dart';

class LocationsNetworkService {
  Dio dio = Dio(BaseOptions(baseUrl: NetworkURL.baseURL));

  Future<List<Location>> getLocations() async {
    try {
      List<Location> allLocations = [];
      for (int i = 1; i < 7; i++) {
        Response response = await dio.get('location/?page=$i');
        if (response.statusCode == 200) {
          allLocations.addAll((response.data['results'] as List)
              .map((e) => Location.fromJson(e))
              .toList());
        } else {
          throw Exception();
        }
      }
      return allLocations;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getTotalLocationsCount() async {
    try {
      Response response = await dio.get('location');
      if (response.statusCode == 200) {
        return response.data['info']['count'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
