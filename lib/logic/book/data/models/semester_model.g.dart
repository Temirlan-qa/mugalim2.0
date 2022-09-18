// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterModel _$SemesterModelFromJson(Map<String, dynamic> json) =>
    SemesterModel(
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['id'] as String?,
      json['cityId'] as String?,
      json['startDate'] as String?,
      json['endDate'] as String?,
      json['semester'] as int?,
      json['year'] as int?,
    );

Map<String, dynamic> _$SemesterModelToJson(SemesterModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'eventLog': instance.eventLog,
      'id': instance.id,
      'cityId': instance.cityId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'semester': instance.semester,
      'year': instance.year,
    };
