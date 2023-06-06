import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final int cost;
  final String sizes;
  final int categoryId;
  final String? description;
  @JsonKey(defaultValue: 0)
  int selectedCount;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.sizes,
    required this.categoryId,
    this.description,
    required this.selectedCount,
  });
  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? cost,
    String? sizes,
    int? categoryId,
    String? description,
    int? selectedCount,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      cost: cost ?? this.cost,
      sizes: sizes ?? this.sizes,
      categoryId: categoryId ?? this.categoryId,
      selectedCount: selectedCount ?? this.selectedCount,
      description: description ?? this.description,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> productToJson(Product instance) =>
      _$ProductToJson(instance);

  String encode(List<Product> products) => json.encode(
        products
            .map<Map<String, dynamic>>((product) => productToJson(product))
            .toList(),
      );
}
