import 'package:flutter/material.dart';
import 'package:hungerz_store/Chat/UI/animated_bottom_bar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/account_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/order_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Bookings/UI/bookings_page.dart';

import 'package:hungerz_store/Pages/items.dart';

class OrderItemAccount extends StatefulWidget {
  final int index;
  const OrderItemAccount([this.index = 0]);
  @override
  _OrderItemAccountState createState() => _OrderItemAccountState();
}

class _OrderItemAccountState extends State<OrderItemAccount> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  final List<Widget> _children = [
    OrderPage(),
    BookingsPage(),
    ItemsPage(),
    AccountPage(),
  ];

  // void onTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  static String bottomIconItem = 'images/footermenu/ic_item.png';

  static String bottomIconTable = 'images/footermenu/ic_table.png';

  static String bottomIconOrder = 'images/footermenu/ic_orders.png';

  static String bottomIconAccount = 'images/footermenu/ic_profile.png';

  @override
  Widget build(BuildContext context) {
    final List<BarItem> barItems = [
      BarItem(
        text: AppLocalizations.of(context)!.orders,
        image: bottomIconOrder,
      ),
      BarItem(
        text: "Table",
        image: bottomIconTable,
      ),
      BarItem(
        text: AppLocalizations.of(context)!.product,
        image: bottomIconItem,
      ),
      BarItem(
        text: "Account",
        image: bottomIconAccount,
      ),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
