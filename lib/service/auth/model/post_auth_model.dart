import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_auth_model.g.dart';

@JsonSerializable(nullable: false)
class PostSessionResponse{
  @JsonKey(name:'session_id')
  final String sessionId;

  @JsonKey(name:'code')
  final String code;

  PostSessionResponse({
    this.sessionId, this.code,
  });

  factory PostSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$PostSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostSessionResponseToJson(this);

}

@JsonSerializable(nullable: false)
class PostOAuthTokenBody {
  final String CUST_EMAIL;
  final String PASSWORD;

  PostOAuthTokenBody({
    @required this.CUST_EMAIL,
    @required this.PASSWORD,
  });

  factory PostOAuthTokenBody.fromJson(Map<String, dynamic> json) =>
      _$PostOAuthTokenBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostOAuthTokenBodyToJson(this);
}
