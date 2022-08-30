// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      json['id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      json['fio'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'fio': instance.fio,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };
