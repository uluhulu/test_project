import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = httpClientInit();
const baseUrl = "https://gist.githubusercontent.com";

Dio httpClientInit() {
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    compact: false,
  );
  final option = BaseOptions(
    baseUrl: baseUrl,
  );
  final dio = Dio(option)..interceptors.add(prettyDioLogger);
  return dio;
}
