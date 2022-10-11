import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/data/network/product_data_provider.dart';
import 'package:hungerz_store/models/products.dart';

class ProductRepository {
  final ProductDataProvider productDataProvider = ProductDataProvider();

  Future<List<Products>> getAllProducts({required String userId}) async {
    try {
      final QuerySnapshot documentsSnapshot =
          await productDataProvider.fetchProducts(userId: userId);
      List<Products> allProducts = [];
      Products product;
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        product = Products.fromJson(docData);
        allProducts.add(product);
      }
      return allProducts;
    } catch (error) {
      rethrow;
    }
  }

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
      bool success = await productDataProvider.addProducts(
        userId: userId,
        description: description,
        listingCategory: listingCategory,
        listingName: listingName,
        rentalDuration: rentalDuration,
        rentalPrice: rentalPrice,
        typeOfRental: typeOfRental,
        rentingRules: rentingRules,
        rentalFor: rentalFor,
        pickup: pickup,
        shopName: shopName,
      );
      return success;
    } catch (error) {
      rethrow;
    }
  }
}
