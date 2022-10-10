import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/repositories/order_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderCubit(this._orderRepository) : super(OrderInitial());
  Future<void> getAllOrders() async {
    final List<Order> allOrders = await _orderRepository.getOrders();
    log('Order: ${allOrders[0].products![0].timeStart}');
    emit(OrdersLoaded(orders: allOrders));
  }
}
