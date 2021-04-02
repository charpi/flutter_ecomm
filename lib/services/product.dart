import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/product.dart';
import '../model/product_summary.dart';

class Product {
  Future<String> dummy() {
    return Future.value('ss');
  }

  Future<List<ProductSummaryDTO>> fetchCategory(String id) async {
    final path = 'resources/summary.json';
    final List<dynamic> json = jsonDecode(await rootBundle.loadString(path));

    return Future.delayed(Duration(seconds: 3),
        () => json.map((p) => ProductSummaryDTO.fromJson(p)).toList());
  }

  Future<ProductDTO> fetchItem(String id) async {
    final path = 'resources/products.json';
    final List<dynamic> json = jsonDecode(await rootBundle.loadString(path));

    return Future.delayed(
        Duration(milliseconds: 3),
        () => json
                .map((p) => ProductDTO.fromMap(p))
                .toList()
                .firstWhere((element) {
              return element.id.compareTo(id) == 0;
            }));
  }
}
