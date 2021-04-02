import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProfile = UserAccountsDrawerHeader(
      accountEmail: Text('john.doe@gmail.com'),
      accountName: Text('John Doe'),
      currentAccountPicture: CircleAvatar(backgroundImage: null),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );

    var tiles = <Widget>[];

    tiles.add(userProfile);
    tiles.addAll([Divider(), Text('My Account'), Divider(), Text('Logout')]);

    return Material(
        color: Theme.of(context).primaryColor,
        child: Container(
            child: ListView(padding: EdgeInsets.all(4.0), children: tiles)));
  }
}
