import 'package:flutter/material.dart';
import 'package:flutter_ecomm/widget/rating.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> ratingStories(BuildContext context) {
  return [
    Story(
        section: 'Ratings',
        name: 'ReadOnly',
        builder: (_, k) {
          var rating = k.options(
            label: 'Ratng',
            initial: 1.0,
            options: [
              Option('1', 1.0),
              Option('2', 2.0),
              Option('3', 3.0),
              Option('4', 4.0),
              Option('5', 5.0),
            ],
          );
          return Rating(initialRating: rating);
        }),
    Story(
        section: 'Ratings',
        name: 'OnTap',
        builder: (ctx, k) {
          var rating = k.options(
            label: 'Ratng',
            initial: 1.0,
            options: [
              Option('1', 1.0),
              Option('2', 2.0),
              Option('3', 3.0),
              Option('4', 4.0),
              Option('5', 5.0),
            ],
          );
          return Rating(
              initialRating: rating,
              onTap: (value) => showDialog(
                  context: ctx,
                  builder: (context) {
                    return Container(
                      height: 100,
                      width: 100,
                      child: Center(child: Text("Tapped $value")),
                    );
                  }));
        })
  ];
}
