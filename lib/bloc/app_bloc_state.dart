part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class PageLoading extends AppState {
  @override
  String toString() => 'PageLoading';
}

class Browse extends AppState {
  final List<ProductSummaryDTO> products;

  Browse({
    required this.products,
  });

  @override
  String toString() => 'Browse';
}

class Item extends AppState {
  final ProductDTO product;

  Item({
    required this.product,
  });

  @override
  String toString() => 'Item';
}
