import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/addtobank_page.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/order/order_cubit.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/repositories/order_repository.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wallet!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Wallet(),
    );
  }
}

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final OrderCubit _orderCubit = instance<OrderCubit>();
  double _totalAvailableBalance = 0.0;
  @override
  void initState() {
    _orderCubit.getAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BlocBuilder<OrderCubit, OrderState>(
          bloc: _orderCubit,
          builder: (context, state) {
            if (state is OrdersLoaded) {
              for (var item in state.allDatas) {
                _totalAvailableBalance =
                    _totalAvailableBalance + item.orders!.total!;
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 20.0, left: 20.0, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.availableBalance!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      letterSpacing: 0.67,
                                      color: kHintColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '${_totalAvailableBalance.toString()}',
                              style: listTitleTextStyle.copyWith(
                                  fontSize: 35.0,
                                  color: kMainTextColor,
                                  letterSpacing: 0.18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        alignment: Alignment.bottomLeft,
                        height: 50.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        color: Theme.of(context).cardColor,
                        child: Text(
                          AppLocalizations.of(context)!.recent!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.08),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 46.0,
                          width: 134.0,
                          decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: kMainColor,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddToBank(
                                        totalAmount: _totalAvailableBalance))),
                            child: Text(
                              AppLocalizations.of(context)!.sendToBank!,
                              style: bottomBarTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...state.allDatas.map((orderItem) =>
                      WalletOrderWidget(order: orderItem.orders!))
                ],
              );
            } else {
              return Align(
                alignment: Alignment.center,
                child: Column(
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
          },
        ),
      ],
    );
  }
}

class WalletOrderWidget extends StatelessWidget {
  const WalletOrderWidget({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    var createdDate = order.createdAt ?? '' as DateTime;
    String formattedDate =
        DateFormat('dd MMM yyy, hh:mm a').format(createdDate);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num ${order.orderNum}',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  Text(
                      '${order.products!.length != null ? order.products!.length : 0} items | $formattedDate',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$ ${order.total ?? 0}',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.online!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$5.20',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
      ],
    );
  }
}
