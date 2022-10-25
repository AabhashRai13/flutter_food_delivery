// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) => Ratings(
      description: json['description'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      userId: firestoreDocRefFromJson(json['userId']),
      createdAt: firestoreTimestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'description': instance.description,
      'star': instance.star,
      'userId': firestoreDocRefToJson(instance.userId),
      'createdAt': firestoreTimestampToJson(instance.createdAt),
    };
