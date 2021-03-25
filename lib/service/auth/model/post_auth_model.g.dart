// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSessionResponse _$PostSessionResponseFromJson(Map<String,dynamic> json) {
  return PostSessionResponse(
    sessionId : json['data']['session_id'] as String,
    code : json['meta']['code'] as String,
  );
}

Map<String, dynamic> _$PostSessionResponseToJson(
        PostSessionResponse instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'code': instance.code,
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
