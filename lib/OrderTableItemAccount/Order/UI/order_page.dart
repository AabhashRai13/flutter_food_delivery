import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/order_list_widget.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/order/order_cubit.dart';
import 'package:hungerz_store/models/all_data.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final OrderCubit _orderCubit = instance<OrderCubit>();
  @override
  void initState() {
    _orderCubit.getAllOrders();
    super.initState();
  }

  List<AllData> newRentalList = [];
  List<AllData> pastRentalList = [];
  List<AllData> ongoingRentalList = [];

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      const Tab(text: "NEW RENTALS"),
      const Tab(text: "PAST RENTALS"),
      const Tab(
        text: "ONGOING RENTALS",
      )
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "My Rentals",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
                labelColor: kMainColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                indicatorColor: kMainColor,
                unselectedLabelColor: kLightTextColor,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              ),
            ),
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          bloc: _orderCubit,
          builder: (context, state) {
            if (state is OrdersLoaded) {
              for (var items in state.allDatas) {
                if (items.orders!.status!.toLowerCase() == 'pending') {
                  newRentalList.add(items);
                } else if (items.orders!.status!.toLowerCase() == 'ongoing') {
                  ongoingRentalList.add(items);
                } else if (items.orders!.status!.toLowerCase() == 'sold' ||
                    items.orders!.status!.toLowerCase() == 'cancelled') {
                  pastRentalList.add(items);
                } else {}
              }

              return TabBarView(children: [
                OrderItemWidget(newRentalList: newRentalList),
                OrderItemWidget(newRentalList: pastRentalList),
                OrderItemWidget(newRentalList: ongoingRentalList),
              ]);
            } else if (state is OrdersLoading) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Please wait orders are loading..."),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
    required this.newRentalList,
  }) : super(key: key);

  final List<AllData> newRentalList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 8.0,
        ),
        Column(
          children: [
            ...newRentalList
                .map((orderItem) => OrderListWidget(data: orderItem))
          ],
        )
      ],
    );
  }
}
