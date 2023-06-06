import 'package:json_annotation/json_annotation.dart';

import '../product/product.dart';
part 'catalog.g.dart';

@JsonSerializable()
class Catalog {
  final int id;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: "category_name")
  final String categoryName;
  final List<Product> products;

  Catalog({
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.products,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
}
