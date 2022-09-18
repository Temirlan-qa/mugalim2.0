// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'semester_model.g.dart';

@JsonSerializable()
class SemesterModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final List? eventLog;
  final String? cityId;
  final String? startDate;
  final String? endDate;
  final int? semester;
  final int? year;

  factory SemesterModel.fromJson(Map<String, dynamic> json) => _$SemesterModelFromJson(json);

  SemesterModel(this.id, this.createdAt, this.updatedAt, this.eventLog, this.cityId, this.startDate, this.endDate, this.semester, this.year);

  Map<String, dynamic> toJson() => _$SemesterModelToJson(this);
}