import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_summary.g.dart';

@JsonSerializable()
@immutable
class ProductSummaryDTO {
  final String id;
  final String title;
  final double rating;
  final String photoUrl;
  final double price;

  ProductSummaryDTO(
    this.id,
    this.title,
    this.rating,
    this.photoUrl,
    this.price,
  );

  factory ProductSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSummaryDTOToJson(this);

  ProductSummaryDTO copyWith(
      {String? id,
      String? title,
      double? rating,
      String? photoUrl,
      double? price}) {
    return ProductSummaryDTO(id ?? this.id, title ?? this.title,
        rating ?? this.rating, photoUrl ?? this.photoUrl, price ?? this.price);
  }

  @override
  String toString() =>
      'ProductSummaryDTO(id: $id, title: $title, rating: $rating)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductSummaryDTO &&
        other.id == id &&
        other.title == title &&
        other.rating == rating;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ rating.hashCode;
}
