import 'package:get_it/get_it.dart';
import 'package:hungerz_store/bloc/order/order_cubit.dart';
import 'package:hungerz_store/bloc/products/products_cubit.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/repositories/order_repository.dart';
import 'package:hungerz_store/repositories/product_repository.dart';
import 'package:hungerz_store/repositories/shop_repository.dart';
import 'package:hungerz_store/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerFactory<OrderRepository>(() => OrderRepository());
  instance.registerFactory<AuthRepository>(() => AuthRepository());
  instance.registerFactory<ShopRepository>(() => ShopRepository());
  instance.registerFactory<ProductRepository>(() => ProductRepository());

//blocs and cubit
  instance.registerFactory<UserCubit>(() => UserCubit());

  instance.registerFactory<OrderCubit>(() => OrderCubit(instance()));
  instance.registerFactory<ProductCubit>(() => ProductCubit(instance()));
}
