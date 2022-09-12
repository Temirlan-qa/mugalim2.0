// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['phone'] as String?,
      json['status'] as bool?,
      json['roles'] as List<dynamic>?,
      json['rolesName'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'status': instance.status,
      'roles': instance.roles,
      'rolesName': instance.rolesName,
    };
