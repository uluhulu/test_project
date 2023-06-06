import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/domain/models/catalog/catalog.dart';
import 'package:test_project/domain/repos/catalog_repo/catalog_repo_impl.dart';
import 'package:test_project/network/api_client/api_client.dart';
import 'package:test_project/network/api_manager.dart';

void main() {
  test('Download release', () async {
    ApiClient apiClient =
        ApiClient(dio, baseUrl: "https://gist.githubusercontent.com");
    CatalogRepositoryImpl repo = CatalogRepositoryImpl(apiClient: apiClient);
    // var response = await repo.getCatalog();
    final response = await dio.get(
        'https://gist.githubusercontent.com/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/eeb0334ccf8e33fb4be7495a395ddc2ec22f3a75/test.json');
    var valueMap = json.decode(response.data);
    List<Catalog> catalogList = [];
    for (var item in valueMap) {
      catalogList.add(Catalog.fromJson(item));
    }

    print("Release 123 : ${response.toString()}");
  });
}
