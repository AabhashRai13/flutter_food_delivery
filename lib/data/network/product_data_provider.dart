import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';

class ProductDataProvider {
  final productsCollection = FirebaseFirestore.instance.collection("products");

  Future<bool> addProducts({
    String? listingName,
    String? listingCategory,
    double? rentalPrice,
    required String userId,
    int? pickup,
    int? typeOfRental,
    String? description,
    String? rentingRules,
    String? rentalFor,
    String? rentalDuration,
    String? shopName,
  }) async {
    try {
      final DocumentReference productData = productsCollection.doc(userId);

      productData.set({
        'listingName': listingName ?? '',
        'listingCategory': listingCategory ?? '',
        'rentalPrice': rentalPrice ?? '',
        'pickUp': pickup ?? -1,
        'typeOfRental': typeOfRental ?? -1,
        'description': description ?? '',
        'rentingRules': rentingRules ?? '',
        'rentalFor': rentalFor ?? '',
        'rentalDuration': rentalDuration ?? '',
        'shopName': shopName ?? '',
      });
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> fetchProducts({required String userId}) async {
    final response = await productsCollection.doc(userId).get();
    return response;
  }
}
