// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semesterDeadline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterDeadlineModel _$SemesterDeadlineModelFromJson(
        Map<String, dynamic> json) =>
    SemesterDeadlineModel(
      json['status'] as String?,
      json['cityId'] as String?,
      json['startDate'] as String?,
      json['endDate'] as String?,
      json['semester'] as int?,
      json['studentCount'] as int?,
      json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$SemesterDeadlineModelToJson(
        SemesterDeadlineModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cityId': instance.cityId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'semester': instance.semester,
      'studentCount': instance.studentCount,
      'images': instance.images,
    };
