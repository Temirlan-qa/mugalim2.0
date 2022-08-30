import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? fio;
  final String? email;
  final String? password;
  final String? avatar;
  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  ProfileModel(this.id, this.firstName, this.lastName, this.middleName, this.fio, this.email, this.password, this.avatar);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
