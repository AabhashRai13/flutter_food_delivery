import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ratings.g.dart';

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
class Ratings {
  String? description;
  double? star;
  @JsonKey(
    toJson: firestoreDocRefToJson,
    fromJson: firestoreDocRefFromJson,
  )
  DocumentReference? userId;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  DateTime? createdAt;

  Ratings({this.description, this.star, this.userId, this.createdAt});
  factory Ratings.fromJson(Map<String, dynamic> data) =>
      _$RatingsFromJson(data);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
