import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_project/network/api_client/api_client.dart';

import '../network/api_manager.dart';
import 'locator.config.dart';

///Service Locator
final sl = GetIt.instance;

@injectableInit
Future<GetIt> configureDependencies() async {
  sl.registerSingleton<Dio>(dio);
  sl.registerSingleton(
    ApiClient(
      sl.get<Dio>(),
    ),
  );

  return $initGetIt(sl);
}
