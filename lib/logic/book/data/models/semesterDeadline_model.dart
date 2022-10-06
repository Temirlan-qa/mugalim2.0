// ignore_for_file: file_names
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mugalim/logic/book/data/models/students_model.dart';


part 'semesterDeadline_model.g.dart';

@JsonSerializable()
class SemesterDeadlineModel {
  final String? status;
  final String? bookGroupId;
  final String? cityId;
  final String? startDate;
  final String? endDate;
  final int? semester;
  final int? studentCount;
  final List<StudentsModel> students;

  factory SemesterDeadlineModel.fromJson(Map<String, dynamic> json) => _$SemesterDeadlineModelFromJson(json);

  SemesterDeadlineModel(this.status, this.bookGroupId, this.cityId, this.startDate, this.endDate, this.semester, this.studentCount, this.students);


  Map<String, dynamic> toJson() => _$SemesterDeadlineModelToJson(this);
}