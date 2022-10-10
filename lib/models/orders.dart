// import 'package:cloud_firestore/cloud_firestore.dart';

// class Order {
//   final String? id;
//   final Documentshop? user;
//   final String? description;
//   final String? imageUrl;
//   final double? totalPrice;
//   final String? address;
//   final double? lat;
//   final double? lng;
//   final dynamic reference;
//   final bool? isPopular;
//   final String? categoryName;
//   final dynamic rating;
//   final dynamic products;
//   final String createdAt;
//   final String? status;

//   const Order(
//       {this.status,
//       required this.createdAt,
//       this.id,
//       this.user,
//       this.description,
//       this.imageUrl,
//       this.totalPrice,
//       this.address,
//       this.lat,
//       this.lng,
//       this.reference,
//       this.isPopular,
//       this.categoryName,
//       this.rating,
//       this.products});
// }import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orders.g.dart';

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

/// Deserialize Firebase Timestamp data type from Firestore
DateTime firestoreTimestampFromJson(dynamic value) {
  return value != null ? DateTime.parse(value.toDate().toString()) : value;
}

/// This method only stores the "timestamp" data type back in the Firestore
dynamic firestoreTimestampToJson(dynamic value) => value;

@JsonSerializable()
class Order {
  String? name;
  double? total;
  String? status;
  List<Product>? products;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  DateTime? createdAt;

  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? user;
  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? shop;

  Order(
      {this.name,
      this.shop,
      this.user,
      this.products,
      this.status,
      this.total,
      this.createdAt});

  /// Create a Order from JSON format
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  /// Convert an Order to JSON format
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Product {
  String? dateStart;
  double? quantity;
  String? nbrPersons;

  String? timeStart;

  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? product;

  Product({
    this.dateStart,
    this.nbrPersons,
    this.quantity,
    this.product,
    this.timeStart,
  });

  /// Create a Product from JSON format
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Convert an Product to JSON format
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
