import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../widget/my_scaffold.dart';
import 'account.dart';
import 'browse.dart' as page;
import 'item.dart' as page;

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: null,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Search Data",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: Theme.of(context).textTheme.button,
      onChanged: null,
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is PageLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is Browse) {
        return page.Browse(products: state.products);
      }
      if (state is Item) {
        return page.Item(product: state.product);
      }
      return Container();
    });
  }

  // TODO: uncomment to demo a more complex drawer
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        drawer: DrawerMenu(),
        appBarTitle: _buildSearchField(context),
        appBarActions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: null),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: null)
        ],
        body: _body(context));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       drawer: DrawerMenu(),
  //       appBar: AppBar(title: _buildSearchField(context), actions: <Widget>[
  //         IconButton(icon: const Icon(Icons.search), onPressed: null)
  //       ]),
  //       body: _body(context));
  // }
}
