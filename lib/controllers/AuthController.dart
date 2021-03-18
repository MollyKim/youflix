import 'package:flutter/material.dart';
import 'package:youflix/controllers/baseController.dart';
import 'package:youflix/models/user_model.dart';
import 'package:youflix/service/auth/model/post_auth_model.dart';
import 'package:youflix/service/root_service.dart';

class AuthController extends BaseController {
  UserModel currentUser;

  AuthController({
    @required RootService rootService
  }) : super(rootService);
  loginUser({
    @required String email,
    @required String password,
}) async {
    assert(email != null);
    assert(password != null);
    print("2");
    final resp = await super.services.authService.postToken(
        PostOAuthTokenBody: PostOAuthTokenBody(
          CUST_EMAIL: email,
          PASSWORD: password,
        ),
    );
    print("@@@");
    this.storageUtils.writeByKey(key: 'session_id', value: resp.sessionId);
    return resp;
  }
}