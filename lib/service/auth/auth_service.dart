import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youflix/consts/network.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youflix/service/auth/model/post_auth_model.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: 'http://$DEV_HOST/CUST/api')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;
  @POST('/log_in')
  Future<PostSessionResponse> postToken({
    @required @Body() PostOAuthTokenBody body,
  });
}

