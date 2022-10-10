// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      ratings: json['ratings'] == null
          ? null
          : Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
    )
      ..description = json['description'] as String?
      ..imageUrl = json['imageUrl'] as String?
      ..isPopular = json['isPopular'] as bool?;

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isPopular': instance.isPopular,
      'ratings': instance.ratings,
    };
