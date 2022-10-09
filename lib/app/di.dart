import 'package:get_it/get_it.dart';
import 'package:hungerz_store/bloc/cubit/order_cubit.dart';
import 'package:hungerz_store/repositories/order_repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //repository
  instance.registerFactory<OrderRepository>(() => OrderRepository());

  instance.registerFactory<OrderCubit>(() => OrderCubit(instance()));
}
