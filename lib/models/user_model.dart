import 'package:flutter/material.dart';
import 'package:youflix/models/base_model.dart';

class UserModel {
  final String userName;
  final String session;

  UserModel({ this.userName, this.session  }) ;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      userName : json['code'],
      session : json['session_id'],
    );
  }
}