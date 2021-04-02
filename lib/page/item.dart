import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../model/product.dart';
import '../model/product_summary.dart';
import '../widget/product_detail.dart';
import '../widget/product_tile.dart';

class Item extends StatelessWidget {
  final ProductDTO product;

  const Item({Key? key, required this.product}) : super(key: key);

  Widget _productInformation(BuildContext context) {
    return Center(
        child: ProductDetail(
      id: product.id,
      title: product.title,
      photoURL: product.photoUrl,
      rating: product.rating,
      price: product.price,
    ));
  }

  Widget _deliveryInformation(BuildContext context) {
    return ExpansionTile(
        title: Text('Delivery'),
        children: [SizedBox(height: 200, child: Text('.....'))]);
  }

  Widget _moreLike(BuildContext context) {
    var child = FutureBuilder(
        // ignore: lines_longer_than_80_chars
        future:
            BlocProvider.of<AppBloc>(context).productService.fetchCategory('1'),
        // ignore: avoid_types_on_closure_parameters
        builder: (context, AsyncSnapshot<List<ProductSummaryDTO>> data) {
          if (data.hasData == false) {
            return CircularProgressIndicator();
          } else {
            var tiles = data.data!.map((product) {
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

            var l = GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                children: tiles);
            return l;
          }
        });
    return ExpansionTile(title: Text('More Like This'), children: [child]);

    // return Expandable(title: Text('More Like This'), child: child);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      child: Icon(Icons.arrow_back),
                      onTap: () =>
                          BlocProvider.of<AppBloc>(context).add(BackEvent())),
                  _productInformation(context),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: _deliveryInformation(context)),
                        Flexible(child: _moreLike(context))
                      ])
                ]),
          );
        } else {
          return ListView(children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () =>
                      BlocProvider.of<AppBloc>(context).add(BackEvent())),
            ),
            _productInformation(context),
            _deliveryInformation(context),
            _moreLike(context)
          ]);
        }
      },
    );
  }
}
