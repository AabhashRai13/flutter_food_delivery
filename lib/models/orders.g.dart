// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      name: json['name'] as String?,
      shop: firestoreDocRefFromJson(json['shop']),
      user: firestoreDocRefFromJson(json['user']),
      product: json['product'],
      status: json['status'] as String?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
      'status': instance.status,
      'product': instance.product,
      'user': firestoreDocRefToJson(instance.user),
      'shop': firestoreDocRefToJson(instance.shop),
    };
