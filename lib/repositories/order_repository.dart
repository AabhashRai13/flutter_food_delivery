import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/data/network/order_data_provider.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/models/user.dart';

class OrderRepository {
  final OrderDataProvider orderDataProvider = OrderDataProvider();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Future<List<AllData>> getOrders() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await orderDataProvider.fetchOrders();
      List<Order> allOrders = [];
      Order order;
      Users user;
      ShopWithId shopWithId;
      AllData allData = AllData();
      List<AllData> allDatas = [];
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        order = Order.fromJson(docData);
        user = await getUserFromOrder(order);
        shopWithId = await getShopFromOrders(order);
        var uuid = await _appPreferences.getUserID();
        if (shopWithId.id == uuid) {
          allOrders.add(order);
          allData = AllData(orders: order, user: user, shop: shopWithId.shop);
          allDatas.add(allData);
        }
      }

      return allDatas;
    } catch (error) {
      rethrow;
    }
  }

  Future<Users> getUserFromOrder(Order order) async {
    Users user = Users();

    final DocumentSnapshot userDocumentsSnapshot =
        await orderDataProvider.fetUserFromOrder(order.user!);
    if (userDocumentsSnapshot.exists) {
      Map<String, dynamic> userData =
          userDocumentsSnapshot.data() as Map<String, dynamic>;
      user = Users.fromJson(userData);
      return user;
    } else {
      return user;
    }
  }

  Future<ShopWithId> getShopFromOrders(Order order) async {
    Shop shop = Shop();
    ShopWithId shopWithId = ShopWithId();
    final DocumentSnapshot shopDocumentsSnapshot =
        await orderDataProvider.fetshopFromOrder(order.shop!);

    if (shopDocumentsSnapshot.exists) {
      Map<String, dynamic> shopData =
          shopDocumentsSnapshot.data() as Map<String, dynamic>;

      shop = Shop.fromJson(shopData);
      shopWithId = ShopWithId(id: shopDocumentsSnapshot.id, shop: shop);

      return shopWithId;
    } else {
      return shopWithId;
    }
  }
}

class ShopWithId {
  final String? id;
  final Shop? shop;
  ShopWithId({this.id, this.shop});
}
