import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:hungerz_store/repositories/order_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderCubit(this._orderRepository) : super(OrderInitial());
  Future<void> getAllOrders() async {
    emit(OrdersLoading());

    final List<AllData> allData = await _orderRepository.getOrders();

    emit(OrdersLoaded(allDatas: allData));
  }
}
