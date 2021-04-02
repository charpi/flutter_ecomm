import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'stories/expandable_stories.dart';
import 'stories/product_tile_stories.dart';
import 'stories/rating_stories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    var stories = <Story>[];
    stories.addAll(ratingStories(context));
    stories.addAll(expandableStories(context));
    stories.addAll(productTileStories(context));
    return Storybook(
      localizationDelegates: <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      children: stories,
    );
  }
}
