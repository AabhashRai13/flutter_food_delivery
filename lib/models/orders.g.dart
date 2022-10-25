// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      name: json['name'] as String?,
      shop: firestoreDocRefFromJson(json['shop']),
      user: firestoreDocRefFromJson(json['user']),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      createdAt: firestoreTimestampFromJson(json['createdAt']),
      orderNum: json['orderNum'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
      'status': instance.status,
      'products': instance.products,
      'createdAt': firestoreTimestampToJson(instance.createdAt),
      'user': firestoreDocRefToJson(instance.user),
      'shop': firestoreDocRefToJson(instance.shop),
      'orderNum': instance.orderNum,
      'paymentMethod': instance.paymentMethod,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      dateStart: json['dateStart'] as String?,
      nbrPersons: json['nbrPersons'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      product: firestoreDocRefFromJson(json['product']),
      timeStart: json['timeStart'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'dateStart': instance.dateStart,
      'quantity': instance.quantity,
      'nbrPersons': instance.nbrPersons,
      'timeStart': instance.timeStart,
      'product': firestoreDocRefToJson(instance.product),
    };
