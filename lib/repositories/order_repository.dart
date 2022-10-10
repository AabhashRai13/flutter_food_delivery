
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/data/network/order_data_provider.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/models/user.dart';

class OrderRepository {
  final OrderDataProvider orderDataProvider = OrderDataProvider();

  Future<AllData> getOrders() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await orderDataProvider.fetchOrders();
      List<Order> allOrders = [];
      Order order;
      Users user;
      Shop shop;
      AllData allData = AllData();
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        order = Order.fromJson(docData);
        user = await getUserFromOrder(order);
        shop = await getShopFromOrders(order);
        allOrders.add(order);
        allData = AllData(orders: allOrders, user: user, shop: shop);
      }

      return allData;
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

  Future<Shop> getShopFromOrders(Order order) async {
    Shop shop = Shop();

    final DocumentSnapshot shopDocumentsSnapshot =
        await orderDataProvider.fetshopFromOrder(order.shop!);
    if (shopDocumentsSnapshot.exists) {
      Map<String, dynamic> shopData =
          shopDocumentsSnapshot.data() as Map<String, dynamic>;
      shop = Shop.fromJson(shopData);
      return shop;
    } else {
      return shop;
    }
  }
}
