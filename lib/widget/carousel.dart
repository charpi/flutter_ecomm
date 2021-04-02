import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPhoto extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  ProductPhoto({required this.image, this.height = 300, this.width = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      margin: EdgeInsets.all(8.0),
      child: Image.network(image,
          // height: this.height, width: this.width,
          fit: BoxFit.scaleDown),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<String> images;

  CarouselWithIndicatorDemo({this.images = const <String>[]});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 1;

  Widget toImageContainer(String item) {
    log(item);
    return ProductPhoto(
      image: item,
      width: 300,
      height: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          child: CarouselSlider(
        items: widget.images.map(toImageContainer).toList(),
        options: CarouselOptions(
            height: 300,
            viewportFraction: 0.5,
            aspectRatio: 2.0,
            autoPlay: false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index + 1;
              });
            }),
      )),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$_current / ${widget.images.length}')]),
    ]);
  }
}
