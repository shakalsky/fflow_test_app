import 'package:fflow_test_app/data/firebase_data_source.dart';
import 'package:fflow_test_app/data/product_repository.dart';
import 'package:fflow_test_app/data/shared/shared_cart_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  i.registerSingleton<FirebaseDataSource>(FirebaseDataSource());

  i.registerSingleton<ProductRepository>(ProductRepository(i.get()));

  i.registerFactory<SelectedProductsSharedCubit>(
    () => SelectedProductsSharedCubit(),
  );
}
