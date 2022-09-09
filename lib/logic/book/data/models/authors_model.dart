// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'authors_model.g.dart';

@JsonSerializable()
class AuthorsModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? firstName;
  final String? lastName;
  final String? fio;
  final String? middleName;
  final int? numberBooks;
  final String? initialName;


  factory AuthorsModel.fromJson(Map<String, dynamic> json) => _$AuthorsModelFromJson(json);

  AuthorsModel(this.id, this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.firstName, this.lastName, this.fio, this.middleName, this.numberBooks, this.initialName);

  Map<String, dynamic> toJson() => _$AuthorsModelToJson(this);
}