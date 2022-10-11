import 'package:hungerz_store/models/ratings.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop.g.dart';

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
  Shop(
      {this.isPopular,
      this.imageUrl,
      this.address,
      this.latitude,
      this.longitude,
      this.name,
      this.ratings,
      this.description,
      this.phoneNumber});
  factory Shop.fromJson(Map<String, dynamic> data) => _$ShopFromJson(data);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
