// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      json['fio'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'avatar': instance.avatar,
      'fio': instance.fio,
    };
