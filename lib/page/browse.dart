import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../model/product_summary.dart';
import '../widget/product_tile.dart';

class Browse extends StatelessWidget {
  final List<ProductSummaryDTO> products;

  const Browse({Key? key, this.products = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tiles = products.map((product) {
      return ProductTile(
          id: product.id,
          title: product.title,
          photoURL: product.photoUrl,
          rating: product.rating,
          price: product.price,
          onClick: (id) {
            BlocProvider.of<AppBloc>(context).add(ProductSelect(id));
          });
    }).toList();

    return GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        children: tiles);
  }
}
