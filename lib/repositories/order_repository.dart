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
      final List<Order> allOrders = [];
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;

        final categoryData = (await docData['category'].get()).data();
        if (docData['rating'] != null) {
          for (dynamic rate in docData['rating']) {
            final rateResp =
                (await (rate['userId'] as DocumentReference).get()).data();
            if (rateResp != null) {
              dynamic rateData = rateResp as Map<String, dynamic>;
              log(rateData);
              rate['username'] = rateData['name'];
            }
          }
        }

        allOrders.add(Order(
            createdAt: docData['createdAt'],
            id: docSnapshot.id,
            reference: docSnapshot.reference,
            user: docData['user'] ?? '',
            description: docData['description'] ?? '',
            imageUrl: docData['imageUrl'] ?? '',
            address: docData['address'] ?? '',
            totalPrice: docData['price'] ?? 0,
            lat: docData['lat'] ?? 0,
            lng: docData['lng'] ?? 0,
            isPopular: docData['isPopular'] ?? false,
            categoryName: categoryData['name'],
            rating: docData['rating'] ?? ''));
      }
      log('Order: ${allOrders[0]}');
      return allOrders;
    } catch (error) {
      rethrow;
    }
  }
}
