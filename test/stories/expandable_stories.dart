import 'package:flutter/material.dart';
import 'package:flutter_ecomm/widget/expandable.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> expandableStories(BuildContext context) {
  return [
    Story(
        section: 'Expandable',
        name: 'Basic',
        builder: (_, k) {
          return Expandable(title: Text('Title'), child: Text('Child'));
        }),
    Story(
        section: 'Expandable',
        name: 'Embedded',
        builder: (_, k) {
          return Column(children: [
            Expandable(title: Text('Title'), child: Text('Child')),
            Align(alignment: Alignment.centerLeft, child: Text('Bottom'))
          ]);
        }),
    Story(
        section: 'Expandable',
        name: 'Embedded 2',
        builder: (_, k) {
          return Row(children: [
            SizedBox(
              width: 150,
              height: 200,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Expandable(title: Text('Title'), child: Text('Child')),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Text('Bottom'))
          ]);
        }),
    Story(
        section: 'Expandable',
        name: 'List',
        builder: (_, k) {
          var number = 1;
          return ListView(children: [
            Expandable(title: Text('Title'), child: Text('Child')),
            ListTile(title: Text("Item $number"))
          ]);
        }),
  ];
}
