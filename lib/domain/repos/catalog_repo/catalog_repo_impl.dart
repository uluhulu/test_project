import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_project/domain/models/catalog/catalog.dart';
import 'package:test_project/domain/repos/catalog_repo/catalog_repo.dart';

import '../../../network/api_client/api_client.dart';

@LazySingleton(as: CatalogRepository)
class CatalogRepositoryImpl extends CatalogRepository {
  final ApiClient apiClient;

  CatalogRepositoryImpl({required this.apiClient});
  @override
  Future<List<Catalog>> getCatalog() async {
    var result = await apiClient.getCatalog();
    var valueMap = json.decode(result);
    List<Catalog> catalogList = [];
    for (var item in valueMap) {
      catalogList.add(Catalog.fromJson(item));
    }
    return catalogList;
  }
}
