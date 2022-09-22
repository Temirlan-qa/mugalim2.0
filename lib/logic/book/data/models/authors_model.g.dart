// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorsModel _$AuthorsModelFromJson(Map<String, dynamic> json) => AuthorsModel(
      json['id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['fio'] as String?,
      json['middleName'] as String?,
      json['numberBooks'] as int?,
      json['initialName'] as String?,
    );

Map<String, dynamic> _$AuthorsModelToJson(AuthorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'eventLog': instance.eventLog,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fio': instance.fio,
      'middleName': instance.middleName,
      'numberBooks': instance.numberBooks,
      'initialName': instance.initialName,
    };
