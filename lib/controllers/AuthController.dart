
import 'package:flutter/cupertino.dart';
import 'package:youflix/controllers/baseController.dart';
import 'package:youflix/models/user_model.dart';
import 'package:youflix/service/root_service.dart';

class AuthController extends BaseController {
  UserModel currentUser;

  AuthController(RootService rootService) : super(rootService);

  loginUser({
    @required String email,
    @required String password,
}) async {
    assert(email != null);
    assert(password != null);

    //final resp = await super.services.


  }
}