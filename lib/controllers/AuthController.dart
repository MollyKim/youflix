
import 'package:flutter/cupertino.dart';
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

    final resp = await super.services.authService.postToken(
        PostOAuthTokenBody: PostOAuthTokenBody(
          username: email,
          password: password,
        ),
    );
    
    this.storageUtils.writeByKey(key: 'accessToken', value: resp.accessTocken);
    //나중에 추가
    //this.storageUtils.writeByKey(key: 'refreshToken', value: resp.refreshToken);

    return resp;
  }
}