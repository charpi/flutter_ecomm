// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSummaryDTO _$ProductSummaryDTOFromJson(Map<String, dynamic> json) {
  return ProductSummaryDTO(
    json['id'] as String,
    json['title'] as String,
    (json['rating'] as num).toDouble(),
    json['photoUrl'] as String,
    (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ProductSummaryDTOToJson(ProductSummaryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rating': instance.rating,
      'photoUrl': instance.photoUrl,
      'price': instance.price,
    };
