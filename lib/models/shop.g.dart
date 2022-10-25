// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      isPopular: json['isPopular'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Ratings.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      category: firestoreDocRefFromJson(json['category']),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isPopular': instance.isPopular,
      'ratings': instance.ratings,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'category': firestoreDocRefToJson(instance.category),
    };
