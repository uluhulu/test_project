import '../../models/catalog/catalog.dart';

abstract class CatalogRepository {
  Future<List<Catalog>> getCatalog();
}
