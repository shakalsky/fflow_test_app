import 'package:fflow_test_app/data/firebase_data_source.dart';
import 'package:fflow_test_app/data/models/product.dart';

class ProductRepository {
  final FirebaseDataSource _firebaseDataSource;

  ProductRepository(this._firebaseDataSource);

  Future<List<Product>> getProducts() async {
    final snapshot = await _firebaseDataSource.getAll();
    if (snapshot != null) {
      final result = <Product>[];
      for (var docSnapshot in snapshot.docs) {
        result.add(Product.fromJson(docSnapshot.id, docSnapshot.data()));
      }
      return result;
    }
    return [];
  }
}
