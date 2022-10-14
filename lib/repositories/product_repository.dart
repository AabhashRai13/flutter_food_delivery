import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/data/network/product_data_provider.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/models/products.dart';

import '../models/shop.dart';
import 'order_repository.dart';

class ProductRepository {
  final ProductDataProvider productDataProvider = ProductDataProvider();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Future<List<ProductId>> getAllProducts() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await productDataProvider.fetchProducts(shopName: shopName);
      List<ProductId> allProducts = [];
      ShopWithId shopWithId;
      Products product;
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        product = Products.fromJson(docData);
        shopWithId = await getShopFromProducts(product);
        var shopId = await _appPreferences.getUserID();

        if (shopWithId.id == shopId) {
          allProducts.add(ProductId(id: docSnapshot.id, product: product));
        }
      }
      return allProducts;
    } catch (error) {
      rethrow;
    }
  }

  Future<ShopWithId> getShopFromProducts(Products product) async {
    Shop shop = Shop();
    ShopWithId shopWithId = ShopWithId();
    if (product.shop == null) return shopWithId;
    final DocumentSnapshot shopDocumentsSnapshot =
        await productDataProvider.fetshopFromProducts(product.shop!);

    if (shopDocumentsSnapshot.exists) {
      Map<String, dynamic> shopData =
          shopDocumentsSnapshot.data() as Map<String, dynamic>;

      shop = Shop.fromJson(shopData);
      shopWithId = ShopWithId(id: shopDocumentsSnapshot.id, shop: shop);

      return shopWithId;
    } else {
      return shopWithId;
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
    String? shopId,
  }) async {
    try {
      var shopName = await _appPreferences.getshopName();
      var shopId = await _appPreferences.getUserID();
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
        shop: firestoreDocRefFromJson("/shops/$shopId"),
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
      var shopId = await _appPreferences.getUserID();
      log("shop id $shopId");
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
        shop: firestoreDocRefFromJson("/shops/$shopId"),
      );
      return success;
    } catch (error) {
      rethrow;
    }
  }

  /// Deserialize Firebase DocumentReference data type from Firestore
  DocumentReference? firestoreDocRefFromJson(dynamic value) {
    if (value is DocumentReference) {
      return FirebaseFirestore.instance.doc(value.path);
    } else if (value is String) {
      return FirebaseFirestore.instance.doc(value);
    }
    return null;
  }
}
