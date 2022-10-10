part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrdersLoaded extends OrderState {
  final AllData allData;
  const OrdersLoaded({required this.allData});
}
