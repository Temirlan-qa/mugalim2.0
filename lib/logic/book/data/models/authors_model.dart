// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'authors_model.g.dart';

@JsonSerializable()
class AuthorsModel {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final int? numberBooks;
  final String? initialName;
  final String? fio;

  factory AuthorsModel.fromJson(Map<String, dynamic> json) => _$AuthorsModelFromJson(json);

  AuthorsModel(this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.id, this.firstName, this.lastName, this.middleName, this.numberBooks, this.initialName, this.fio);



  Map<String, dynamic> toJson() => _$AuthorsModelToJson(this);
}