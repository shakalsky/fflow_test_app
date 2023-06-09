import 'package:fflow_test_app/data/models/product.dart';

class SelectedProductsState {
  final List<Product> products;

  SelectedProductsState({required this.products});

  SelectedProductsState newState({List<Product>? products}) {
    return SelectedProductsState(
      products: products ?? this.products,
    );
  }
}
