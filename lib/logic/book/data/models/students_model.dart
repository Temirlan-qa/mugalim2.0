// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'students_model.g.dart';

@JsonSerializable()
class StudentsModel {

  final String? id;
  final String? avatar;
  final String? fio;

  factory StudentsModel.fromJson(Map<String, dynamic> json) => _$StudentsModelFromJson(json);

  StudentsModel(this.id, this.avatar, this.fio);


  Map<String, dynamic> toJson() => _$StudentsModelToJson(this);
}