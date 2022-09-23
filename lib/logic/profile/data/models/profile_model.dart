// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String? id;

  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? fio;
  final String? fioShort;
  // Ask a question about
  final String? avatar;


  final String? gender;
  final Map<String, dynamic>? user;

  final List<dynamic> groups;
  final List<dynamic> cities;
  final List<dynamic> regions;
  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  ProfileModel(this.id, this.firstName, this.lastName, this.middleName,  this.fio, this.fioShort, this.avatar,  this.gender, this.user,this.cities,this.groups,this.regions);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}