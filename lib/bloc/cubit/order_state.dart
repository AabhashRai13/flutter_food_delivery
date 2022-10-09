part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<Order> orders;
  const OrdersLoaded({required this.orders});
}
