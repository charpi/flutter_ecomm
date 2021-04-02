import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class ProductDTO {
  final String id;
  final String title;
  final double rating;
  final List<String> photoUrl;
  final String description;
  final double price;

  ProductDTO(
    this.id,
    this.title,
    this.rating,
    this.photoUrl,
    this.description,
    this.price,
  );

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ProductDTO(id: $id, title: $title, rating: $rating, photoUrl: $photoUrl, description: $description, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductDTO &&
        other.id == id &&
        other.title == title &&
        other.rating == rating &&
        other.photoUrl == photoUrl &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        rating.hashCode ^
        photoUrl.hashCode ^
        description.hashCode ^
        price.hashCode;
  }

  ProductDTO copyWith({
    String? id,
    String? title,
    double? rating,
    List<String>? photoUrl,
    String? description,
    double? price,
  }) {
    return ProductDTO(
      id ?? this.id,
      title ?? this.title,
      rating ?? this.rating,
      photoUrl ?? this.photoUrl,
      description ?? this.description,
      price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'photoUrl': photoUrl,
      'description': description,
      'price': price,
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      map['id'],
      map['title'],
      map['rating'],
      List<String>.from(map['photoUrl']),
      map['description'],
      map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) =>
      ProductDTO.fromMap(json.decode(source));
}
