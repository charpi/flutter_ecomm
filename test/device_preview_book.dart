import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:storybook_device_preview/storybook_device_preview.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/expandable_stories.dart';
import 'stories/rating_stories.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stories = <Story>[];
    stories.addAll(ratingStories(context));
    stories.addAll(expandableStories(context));

    return CustomStorybook(
        builder: (context) {
          return DevicePreview(
            plugins: storybookPlugins,
            builder: (context) => MaterialApp(
              builder: DevicePreview.appBuilder,
              locale: DevicePreview.locale(context),
              home: const Scaffold(body: CurrentStory()),
            ),
          );
        },
        children: stories);
  }
}
