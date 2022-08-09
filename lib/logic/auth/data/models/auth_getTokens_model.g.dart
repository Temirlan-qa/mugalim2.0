// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_getTokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokensModel _$AuthTokensModelFromJson(Map<String, dynamic> json) =>
    AuthTokensModel(
      json['access_token'] as String?,
      json['token_type'] as String?,
      json['refresh_token'] as String?,
      json['expires_in'] as int?,
      json['scope'] as String?,
      json['jti'] as String?,
    );

Map<String, dynamic> _$AuthTokensModelToJson(AuthTokensModel instance) =>
    <String, dynamic>{
      'access_token': instance.access,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'jti': instance.jti,
    };
