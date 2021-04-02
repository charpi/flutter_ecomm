import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';
import 'page/home.dart';
import 'services/product.dart';

void main() {
  runApp(MyApp());
}

// ignore: public_member_api_docs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ECommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppBloc>(
        create: (context) => AppBloc(Product())..add(AppStarted()),
        child: HomePage(title: 'Flutter ECommerce'),
      ),
    );
  }
}
