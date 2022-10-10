import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/data/network/order_data_provider.dart';
import 'package:hungerz_store/models/orders.dart';
import 'package:hungerz_store/models/user.dart';

class OrderRepository {
  final OrderDataProvider orderDataProvider = OrderDataProvider();

  Future<List<Order>> getOrders() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await orderDataProvider.fetchOrders();
      List<Order> allOrders = [];
      Order order;
      Users user;
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        order = Order.fromJson(docData);
        user = await getUserFromOrder(order);

        allOrders.add(order);
      }

      return allOrders;
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
      log(user.name ?? "");
      return user;
    } else {
      return user;
    }
  }
}
