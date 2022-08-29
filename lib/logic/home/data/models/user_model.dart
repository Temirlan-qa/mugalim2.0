import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? avatar;
  final String? fio;


  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserModel(this.id, this.firstName, this.lastName, this.middleName, this.fio,  this.avatar);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}