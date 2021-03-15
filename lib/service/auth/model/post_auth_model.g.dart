// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTokenResponse _$PostTokenResponseFromJson(Map<String, dynamic> json) {
  return PostTokenResponse(
    accessTocken: json['access_tocken'] as String,
    tokenType: json['token_type'] as String,
    refreshToken: json['refresh_token'] as String,
    expiresIn: json['expires_in'] as String,
    scope: json['scope'] as String,
  );
}

Map<String, dynamic> _$PostTokenResponseToJson(PostTokenResponse instance) =>
    <String, dynamic>{
      'access_tocken': instance.accessTocken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
    };

PostOAuthTokenBody _$PostOAuthTokenBodyFromJson(Map<String, dynamic> json) {
  return PostOAuthTokenBody(
    CUST_EMAIL: json['CUST_EMAIL'] as String,
    PASSWORD: json['PASSWORD'] as String,
  );
}

Map<String, dynamic> _$PostOAuthTokenBodyToJson(PostOAuthTokenBody instance) =>
    <String, dynamic>{
      'CUST_EMAIL': instance.CUST_EMAIL,
      'PASSWORD': instance.PASSWORD,
    };
