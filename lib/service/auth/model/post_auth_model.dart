import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_auth_model.g.dart';

@JsonSerializable(nullable: false)
class PostTokenResponse {
  @JsonKey(name: 'access_tocken')
  final String accessTocken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final String expiresIn;
  final String scope;

  PostTokenResponse({
    this.accessTocken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn, this.scope
  });

  factory PostTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$PostTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostTokenResponseToJson(this);
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
