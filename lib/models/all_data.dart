import 'package:hungerz_store/models/products.dart';
import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/models/user.dart';

import 'orders.dart';

class AllData {
  Order? orders;
  Shop? shop;
  Users? user;
  List<Products>? products;
  AllData({this.orders, this.shop, this.user, this.products});
}
