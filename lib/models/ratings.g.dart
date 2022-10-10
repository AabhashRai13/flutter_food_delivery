// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) => Ratings(
      description: json['description'] as String?,
      start: json['start'] as String?,
      userId: firestoreDocRefFromJson(json['userId']),
    );

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'description': instance.description,
      'start': instance.start,
      'userId': firestoreDocRefToJson(instance.userId),
    };
