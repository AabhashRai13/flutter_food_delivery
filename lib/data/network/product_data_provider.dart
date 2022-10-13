import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';

class ProductDataProvider {
  final productsCollection = FirebaseFirestore.instance.collection("products");
  final AppPreferences _appPreferences = instance<AppPreferences>();

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
      productsCollection.add({
        'listingName': listingName ?? '',
        'listingCategory': listingCategory ?? '',
        'rentalPrice': rentalPrice ?? '',
        'pickup': pickup ?? -1,
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

  Future<bool> editProducts(
      {String? listingName,
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
      required String productId}) async {
    try {
      final DocumentReference product = productsCollection.doc(productId);

      product.update({
        'listingName': listingName,
        'listingCategory': listingCategory,
        'rentalPrice': rentalPrice,
        'pickup': pickup,
        'typeOfRental': typeOfRental,
        'description': description,
        'rentingRules': rentingRules,
        'rentalFor': rentalFor,
        'rentalDuration': rentalDuration,
        'shopName': shopName,
      });
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> fetchProducts({required String shopName}) async {
    final response = await productsCollection.get();

    return response;
  }
}
