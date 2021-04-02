import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/product.dart';

import '../model/product_summary.dart';
import '../services/product.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Product productService;
  AppBloc(this.productService) : super(PageLoading());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppStarted) {
      add(AppBrowseEvent('1'));
    } else {
      if (event is AppBrowseEvent) {
        var products = await productService.fetchCategory(event.id);
        yield Browse(products: products);
      } else if (event is ProductSelect) {
        yield PageLoading();
        var item = await productService.fetchItem(event.id);
        yield Item(product: item);
      } else if (event is BackEvent) {
        yield PageLoading();
        add(AppBrowseEvent('1'));
      }
    }
  }
}
