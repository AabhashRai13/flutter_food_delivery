// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      add: json['add'] as String?,
      subscription: json['subscription'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'add': instance.add,
      'subscription': instance.subscription,
    };
