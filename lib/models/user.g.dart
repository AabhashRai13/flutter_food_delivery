// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
    )
      ..walletBalance = (json['walletBalance'] as num?)?.toDouble()
      ..homeAddress = json['homeAddress'] == null
          ? null
          : Address.fromJson(json['homeAddress'] as Map<String, dynamic>)
      ..officeAddress = json['officeAddress'] == null
          ? null
          : Address.fromJson(json['officeAddress'] as Map<String, dynamic>)
      ..otherAddress = json['otherAddress'] == null
          ? null
          : Address.fromJson(json['otherAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'imageUrl': instance.imageUrl,
      'walletBalance': instance.walletBalance,
      'homeAddress': instance.homeAddress,
      'officeAddress': instance.officeAddress,
      'otherAddress': instance.otherAddress,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressType: json['addressType'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressType': instance.addressType,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
