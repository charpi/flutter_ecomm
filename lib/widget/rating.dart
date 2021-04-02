import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double initialRating;
  final double size;
  final Color? color;
  final Function(double)? onTap;

  Rating(
      {required this.initialRating, this.size = 18.0, this.color, this.onTap});

  Widget _star(double value, Color color) {
    Widget element = Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Icon(
        initialRating >= value ? Icons.star : Icons.star_border,
        color: color,
        size: size,
      ),
    );

    if (onTap == null) {
      return element;
    } else {
      return GestureDetector(
        child: element,
        onTap: () => onTap == null ? () => {} : onTap!(value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var realColor = color ?? Theme.of(context).primaryColorDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _star(1, realColor),
        _star(2, realColor),
        _star(3, realColor),
        _star(4, realColor),
        _star(5, realColor),
      ],
    );
  }
}
