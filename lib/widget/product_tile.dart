import 'package:flutter/material.dart';
import 'rating.dart';

typedef OnClick = void Function(String);

class ProductTile extends StatelessWidget {
  final String id;
  final String title;
  final String photoURL;
  final double price;
  final double width;
  final double height;
  final OnClick? onClick;
  final double rating;

  const ProductTile(
      {Key? key,
      required this.title,
      required this.photoURL,
      required this.price,
      this.width = 100,
      this.height = 100,
      this.onClick,
      this.rating = 0.0,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
        child: Stack(
          children: [_background(context)],
        ));
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
    return InkWell(
        onTap: onClick != null ? () => onClick!(id) : null,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(photoURL), fit: BoxFit.scaleDown),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              _content(context),
            ]));
  }
}
