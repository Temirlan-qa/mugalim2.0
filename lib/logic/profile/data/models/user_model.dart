// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  final String? id;
  final String? email;
  final String? password;
  final String? phone;
  final bool? status;
  final List? roles;
  final List? rolesName;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  UserModel(this.id, this.email, this.password, this.phone, this.status, this.roles, this.rolesName);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}