import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/data/network/product_data_provider.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/models/products.dart';

class ProductRepository {
  final ProductDataProvider productDataProvider = ProductDataProvider();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Future<List<ProductId>> getAllProducts({required String userId}) async {
    try {
      final QuerySnapshot documentsSnapshot =
          await productDataProvider.fetchProducts(shopName: shopName);
      List<ProductId> allProducts = [];
      Products product;
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        product = Products.fromJson(docData);
        allProducts.add(ProductId(id: docSnapshot.id, product: product));
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
  }) async {
    try {
      var shopName = await _appPreferences.getshopName();
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

  Future<bool> editProducts({
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
    required String productId,
  }) async {
    try {
      var shopName = await _appPreferences.getshopName();
      bool success = await productDataProvider.editProducts(
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
        productId: productId,
      );
      return success;
    } catch (error) {
      rethrow;
    }
  }
}
