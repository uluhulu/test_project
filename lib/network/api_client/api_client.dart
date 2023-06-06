import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(
      '/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/a9e1f131b123aac1d5661215ba54ed164296e866')
  Future<String> getCatalog();
}
