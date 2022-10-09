import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/repositories/order_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderCubit(this._orderRepository) : super(OrderInitial());
  Future<void> getAllOrders() async {
    final List<Order> allShops = await _orderRepository.getOrders();

    emit(OrdersLoaded(orders: allShops));
  }
}
