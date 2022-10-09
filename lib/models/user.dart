import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? name, lastName, add;
  bool? subscription;

  User({this.name,this.lastName,this.add,this.subscription,});

  factory User.fromJson(Map<String,dynamic> data) => _$UserFromJson(data);

  Map<String,dynamic> toJson() => _$UserToJson(this);

}