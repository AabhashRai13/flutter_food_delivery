import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesProvider {
  final categoriesCollection =
      FirebaseFirestore.instance.collection("categories");
  Future<dynamic> fetchCategories() async {
    final response = await categoriesCollection.get();

    return response;
  }

  Future<dynamic> fetCategory(DocumentReference docReference) async {
    final response = await docReference.get();

    return response;
  }
}
