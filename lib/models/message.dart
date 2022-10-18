

import 'package:hungerz_store/app/utils.dart';

class MessageField {
  static const String createdAt = 'createdAt';
}

class Message {
  final String idUser;
  
  final String username;
  final String message;
  final DateTime createdAt;

  const Message({
    required this.idUser,

    required this.username,
    required this.message,
    required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        idUser: json['idUser'],
      
        username: json['username'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt'])!,
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
     
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}