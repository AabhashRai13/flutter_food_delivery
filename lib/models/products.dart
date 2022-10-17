import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';

/// Deserialize Firebase DocumentReference data type from Firestore
DocumentReference? firestoreDocRefFromJson(dynamic value) {
  if (value is DocumentReference) {
    return FirebaseFirestore.instance.doc(value.path);
  } else if (value is String) {
    return FirebaseFirestore.instance.doc(value);
  }
  return null;
}

/// This method only stores the "relation" data type back in the Firestore
dynamic firestoreDocRefToJson(dynamic value) => value;

@JsonSerializable()
class Products {
  String? listingName;
  String? listingCategory;
  double? rentalPrice;
  String? listingId;
  String? shopName;
  int? pickup;
  int? typeOfRental;
  String? description;
  String? rentingRules;
  String? rentalFor;
  String? rentalDuration;
  bool? instock;
  String? imageUrl;
  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? shop;
  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? category;
  Products(
      {this.listingName,
      this.listingCategory,
      this.rentalPrice,
      this.listingId,
      this.pickup,
      this.shopName,
      this.typeOfRental,
      this.description,
      this.rentingRules,
      this.rentalFor,
      this.rentalDuration,
      this.instock,
      this.shop,
      this.category,
      this.imageUrl});

  /// Create a Product from JSON format
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  /// Convert an Product to JSON format
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
