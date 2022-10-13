import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDataProvider {
  Future<dynamic> fetchOrders() async {
    final response =
        await FirebaseFirestore.instance.collection("orders").get();

    return response;
  }

  Future<dynamic> fetUserFromOrder(DocumentReference docReference) async {
    final response = await docReference.get();

    return response;
  }

  Future<dynamic> fetshopFromOrder(DocumentReference docReference) async {
    final response = await docReference.get();

    return response;
  }
}
