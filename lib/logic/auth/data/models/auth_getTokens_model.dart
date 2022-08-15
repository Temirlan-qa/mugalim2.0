import 'package:json_annotation/json_annotation.dart';

part 'auth_getTokens_model.g.dart';

@JsonSerializable()
class AuthTokensModel {
  @JsonKey(name: 'access_token')
  final String? access;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  final String? scope;
  final String? jti;

  factory AuthTokensModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensModelFromJson(json);

  AuthTokensModel(this.access, this.tokenType, this.refreshToken,
      this.expiresIn, this.scope, this.jti);

  Map<String, dynamic> toJson() => _$AuthTokensModelToJson(this);
}
