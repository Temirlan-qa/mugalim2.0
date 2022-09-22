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
      json['fioShort'] as String?,
      json['avatar'] as String?,
      json['gender'] as String?,
      json['user'] as Map<String, dynamic>?,
      json['cities'] as List<dynamic>,
      json['groups'] as List<dynamic>,
      json['regions'] as List<dynamic>,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'fio': instance.fio,
      'fioShort': instance.fioShort,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'user': instance.user,
      'groups': instance.groups,
      'cities': instance.cities,
      'regions': instance.regions,
    };
