import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/data/network/order_data_provider.dart';
import 'package:hungerz_store/models/orders.dart';

class OrderRepository {
  final OrderDataProvider orderDataProvider = OrderDataProvider();

  Future<List<Order>> getOrders() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await orderDataProvider.fetchOrders();
      List<Order> allOrders = [];
      Order order;

      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        order = Order.fromJson(docData);
        allOrders.add(order);
      }
      log('Order: ${allOrders[0].total}');
      return allOrders;
    } catch (error) {
      rethrow;
    }
  }
}
