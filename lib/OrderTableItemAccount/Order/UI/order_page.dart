import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/cubit/order_cubit.dart';

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
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, PageRoutes.orderInfoPage),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              state.allDatas[0].user!.name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                      fontSize: 13.3,
                                                      letterSpacing: 0.07),
                                            ),
                                            const Spacer(),
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .pending!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(
                                                        color: const Color(
                                                            0xffffa025),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11.7,
                                                        letterSpacing: 0.06)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Order AE5587 | 22 June, 11:35 am',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      fontSize: 11.7,
                                                      letterSpacing: 0.06,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '\$ 21.00 | COD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      fontSize: 11.7,
                                                      letterSpacing: 0.06,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                              Divider(
                                color: Theme.of(context).cardColor,
                                thickness: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Text('Veg Sandwich x1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 11.7,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.06,
                                                color: Colors.black)),
                                    Text(
                                      '(Extra Cheese)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontSize: 11.7,
                                              letterSpacing: 0.06,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Text('Fried Chicken x1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 11.7,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.06,
                                                color: Colors.black)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Text('WaterMelon Juice x1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 11.7,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.06,
                                                color: Colors.black)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Divider(
                                color: Theme.of(context).cardColor,
                                thickness: 8.0,
                              ),
                            ],
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 30,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.green[800],
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Row(
                              children: [
                                Text("Delivery",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                const Spacer(),
                                Text("1:20",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const SizedBox()
        ]),
      ),
    );
  }
}
