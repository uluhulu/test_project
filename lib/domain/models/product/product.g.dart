// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      cost: json['cost'] as int,
      sizes: json['sizes'] as String,
      categoryId: json['categoryId'] as int,
      description: json['description'] as String?,
      selectedCount: json['selectedCount'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'cost': instance.cost,
      'sizes': instance.sizes,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'selectedCount': instance.selectedCount,
    };
