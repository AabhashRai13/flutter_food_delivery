import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';

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

  Products({
    this.listingName,
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
  });

  /// Create a Product from JSON format
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  /// Convert an Product to JSON format
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
