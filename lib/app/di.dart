import 'package:get_it/get_it.dart';
import 'package:hungerz_store/bloc/cubit/order_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{
  instance.registerFactory<OrderCubit>(() => OrderCubit(instance()));
}
