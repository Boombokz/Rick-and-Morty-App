import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_test/constants/network/network_url.dart';

final getIt = GetIt.instance;

void initInjections() {
  /// DioWrappers
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: NetworkURL.baseURL,
        connectTimeout: 15000,
        sendTimeout: 7000,
      ),
    ),
    instanceName: 'Base',
  );

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: 15000,
        sendTimeout: 7000,
      ),
    ),
    instanceName: 'Empty',
  );
}
