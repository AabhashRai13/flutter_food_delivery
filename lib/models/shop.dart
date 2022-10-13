import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/models/ratings.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop.g.dart';

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
class Shop {
  String? address;
  String? name;
  double? latitude, longitude;
  String? description;
  String? imageUrl;
  bool? isPopular;
  Ratings? ratings;
  String? phoneNumber;
  String? email;
  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? category;
  Shop(
      {this.isPopular,
      this.imageUrl,
      this.address,
      this.latitude,
      this.longitude,
      this.name,
      this.ratings,
      this.description,
      this.phoneNumber,
      this.category,
      this.email});
  factory Shop.fromJson(Map<String, dynamic> data) => _$ShopFromJson(data);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
