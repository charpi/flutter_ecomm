import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  final Widget child;
  final Widget title;

  const Expandable({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  ExpandableState createState() => ExpandableState();
}

class ExpandableState extends State<Expandable> {
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var icon = expanded ? Icons.expand_more : Icons.expand_less;
    var children = <Widget>[
      GestureDetector(
          onTap: () => setState(() {
                expanded = !expanded;
              }),
          child: Row(children: [Expanded(child: widget.title), Icon(icon)]))
    ];

    if (expanded) {
      children.add(widget.child);
    }
    return Column(children: children);
  }
}
