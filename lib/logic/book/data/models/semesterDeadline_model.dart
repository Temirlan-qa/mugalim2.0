// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'semesterDeadline_model.g.dart';

@JsonSerializable()
class SemesterDeadlineModel {
  final String? status;
  final String? cityId;
  final String? startDate;
  final String? endDate;
  final int? semester;
  final int? studentCount;
  final List? images;

  factory SemesterDeadlineModel.fromJson(Map<String, dynamic> json) => _$SemesterDeadlineModelFromJson(json);

  SemesterDeadlineModel(this.status, this.cityId, this.startDate, this.endDate, this.semester, this.studentCount, this.images);


  Map<String, dynamic> toJson() => _$SemesterDeadlineModelToJson(this);
}