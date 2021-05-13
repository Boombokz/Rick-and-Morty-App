import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/constants/network/network_url.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';

class LocationsAPI {
  Dio dio = Dio(BaseOptions(baseUrl: NetworkURL.baseURL));

  Future<List<Location>> getLocations(int i) async {
    try {
      Response response = await dio.get('location/?page=$i');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => Location.fromJson(e))
            .toList();
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getTotalLocationsCount() async {
    try {
      Response response = await dio.get('location/');
      if (response.statusCode == 200) {
        return response.data['info']['count'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getLocationTotalPagesCount() async {
    try {
      Response response = await dio.get('location/');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<List<Location>> searchLocations(String text, int i) async {
    try {
      Response response = await dio.get('location/?page=$i&name=$text');

      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => Location.fromJson(e))
            .toList();
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<int> getLocationSearchPagesCount(String name) async {
    try {
      Response response = await dio.get('location/?name=$name');
      if (response.statusCode == 200) {
        return response.data['info']['pages'];
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
