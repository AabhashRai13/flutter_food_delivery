// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      listingName: json['listingName'] as String?,
      listingCategory: json['listingCategory'] as String?,
      rentalPrice: (json['rentalPrice'] as num?)?.toDouble(),
      listingId: json['listingId'] as String?,
      pickup: json['pickup'] as int?,
      shopName: json['shopName'] as String?,
      typeOfRental: json['typeOfRental'] as int?,
      description: json['description'] as String?,
      rentingRules: json['rentingRules'] as String?,
      rentalFor: json['rentalFor'] as String?,
      rentalDuration: json['rentalDuration'] as String?,
      instock: json['instock'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      shop: firestoreDocRefFromJson(json['shop']),
      category: firestoreDocRefFromJson(json['category']),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'listingName': instance.listingName,
      'listingCategory': instance.listingCategory,
      'rentalPrice': instance.rentalPrice,
      'listingId': instance.listingId,
      'shopName': instance.shopName,
      'pickup': instance.pickup,
      'typeOfRental': instance.typeOfRental,
      'description': instance.description,
      'rentingRules': instance.rentingRules,
      'rentalFor': instance.rentalFor,
      'rentalDuration': instance.rentalDuration,
      'instock': instance.instock,
      'imageUrl': instance.imageUrl,
      'shop': firestoreDocRefToJson(instance.shop),
      'category': firestoreDocRefToJson(instance.category),
    };
