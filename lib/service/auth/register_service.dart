import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youflix/consts/network.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youflix/service/auth/model/post_auth_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_service.g.dart';

@JsonSerializable(nullable: false)
@RestApi(baseUrl: 'http://$DEV_HOST/CUST/api')
abstract class RegisterService {
  factory RegisterService(Dio dio, {String baseUrl}) = _RegisterService;

  @POST('/sign_up')
  Future<PostSessionResponse> postToken({
    @required @Body() PostOAuthTokenBody,
  });
}