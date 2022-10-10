import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class Users {
  String? name, email, phoneNumber, photoUrl, imageUrl;
  double? walletBalance;
  Address? homeAddress;
  Address? officeAddress;
  Address? otherAddress;

  Users({
    this.name,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.imageUrl,
  });

  factory Users.fromJson(Map<String, dynamic> data) => _$UsersFromJson(data);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable()
class Address {
  String? addressType;
  String? name;
  double? latitude, longitude;

  Address({this.addressType, this.latitude, this.longitude, this.name});
  factory Address.fromJson(Map<String, dynamic> data) =>
      _$AddressFromJson(data);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
