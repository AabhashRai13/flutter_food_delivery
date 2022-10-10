import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/models/user.dart';

import 'orders.dart';

class AllData {
  List<Order>? orders;
  Shop? shop;
  Users? user;
  AllData({this.orders, this.shop, this.user});
}
