import 'package:crypto/crypto.dart';
import 'dart:convert';

/*
 * 작성일 : 2021-03-09
 * 작성자 : 김명희
 * 화면명 : HR_0001
 * 경로 :
 * 클래스 : LoginFormModel
 * 설명 : 단순 로그인에 사용될 모델
 */

class LoginFormModel{
  String _email;
  var pw;

  setEmail(String email){
    _email = email;
  }

  setPassword(String password){
    var bytes = utf8.encode(password);
    pw = sha256.convert(bytes);
  }

  get email => _email;

  get password => pw.toString();
}
