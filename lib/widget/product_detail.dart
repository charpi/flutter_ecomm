import 'package:flutter/material.dart';
import 'carousel.dart';
import 'rating.dart';

class ProductDetail extends StatelessWidget {
  final String id;
  final String title;
  final List<String> photoURL;
  final double price;
  final double rating;

  const ProductDetail(
      {Key? key,
      required this.title,
      required this.photoURL,
      required this.price,
      this.rating = 0.0,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Column(children: [_background(context)]));
  }

  Widget _buildPrice(ThemeData _theme) {
    return Row(children: <Widget>[
      Text(
        '\$${price.toStringAsFixed(2)}',
        style: _theme.textTheme.bodyText2?.copyWith(
          decoration: TextDecoration.none,
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
    ]);
  }

  Widget _buildRating(BuildContext context) {
    return Rating(
      size: 10.0,
      initialRating: rating,
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildRating(context),
        Text(title, style: Theme.of(context).textTheme.bodyText2),
        _buildPrice(Theme.of(context)),
      ],
    );
  }

  Widget _background(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselWithIndicatorDemo(images: photoURL),
          _content(context),
        ]);
  }
}
