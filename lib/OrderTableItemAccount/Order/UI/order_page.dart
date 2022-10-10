import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/order_list_widget.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/cubit/order_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: AppLocalizations.of(context)!.newOrder),
      Tab(text: AppLocalizations.of(context)!.pastOrder),
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
              AppLocalizations.of(context)!.orderText!,
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
        body: TabBarView(children: [
          BlocBuilder<OrderCubit, OrderState>(
            bloc: _orderCubit,
            builder: (context, state) {
              if (state is OrdersLoaded) {
                return ListView(
                  children: <Widget>[
                    Divider(
                      color: Theme.of(context).cardColor,
                      thickness: 8.0,
                    ),
                    Column(
                      children: [
                        ...state.allDatas.map(
                            (orderItem) => OrderListWidget(data: orderItem))
                      ],
                    )
                  ],
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          ),
          const SizedBox()
        ]),
      ),
    );
  }
}
