import 'package:fflow_test_app/data/models/product.dart';
import 'package:fflow_test_app/data/shared/shared_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedProductsSharedCubit extends Cubit<SelectedProductsState> {
  SelectedProductsSharedCubit() : super(SelectedProductsState(products: []));

  List<Product> addProduct(Product product) {
    emit(state.newState(products: [...state.products, product]));
    return state.products;
  }

  void deleteProduct(Product product) {
    final updatedProducts = state.products;
    updatedProducts.remove(product);
    emit(state.newState(products: [...updatedProducts]));
  }

  void resetSelectedStories() => emit(state.newState(products: []));
}
