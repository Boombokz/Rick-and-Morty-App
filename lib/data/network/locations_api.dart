import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/data/models/locations/location_model.dart';
import 'package:rick_and_morty_test/utils/injection_container.dart';

class LocationsAPI {
   Dio dio = getIt.get<Dio>(instanceName: 'Base');

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
    } on Exception {
      rethrow;
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
    } on Exception {
      rethrow;
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
    } on Exception {
      rethrow;
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
    } on Exception {
      rethrow;
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
    } on Exception {
      rethrow;
    }
  }

  Future<Location> getLocationDetails(int id) async {
    try {
      Response response = await dio.get('location/$id');

      if (response.statusCode == 200) {
        return Location.fromJson(response.data);
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }
}
