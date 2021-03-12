import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youflix/components/text_field/password_text_field.dart';
import 'package:youflix/controllers/AuthController.dart';
import 'package:youflix/models/internal_models/login_form_model.dart';
import 'package:youflix/components/exports_text_field.dart';
import 'package:youflix/layouts/exports_layouts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:youflix/models/user_model.dart';
import 'package:get/get.dart';

/*
 * 작성일 : 2021-03-09
 * 작성자 : 김명희
 * 화면명 : HL_0001
 * 주요기능 : 로그인 화면
 */

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formModel = LoginFormModel();
  bool isFormLoading = false;
  final formKey = GlobalKey<FormState>();

  renderLogo() {
    return Center(
      child: SvgPicture.asset(
        'assets/netflix_app_icon.svg',
      ),
    );
  }

  renderAuthField() {
    return Column(
      children: [
        EmailTextField(
          isBlack: true,
          onSaved: formModel.setEmail,
        ),
        SizedBox(height: 20,),
        PasswordTextField(
          isBalck: true,
          onSaved: formModel.password,
        )
      ],
    );
  }

  renderLoginButton() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: this.isFormLoading ? null : () async{
              if(this.formKey.currentState.validate()) {
                setState(() {
                  this.isFormLoading = true;
                });
                this.formKey.currentState.save();

                // try {
                //   await Get.find<AuthController>() //암호화된 패스워드 넘겨줌
                // }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.grey
              ),
                child: InkWell(
                  onTap: this.isFormLoading ? null : () async {
                },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text('로그인',style: TextStyle(color: Colors.white),),
                    ),
                  ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {


    return DefaultLayout(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          renderLogo(),
          Container(height: 50.0),
          renderAuthField(),
          Container(height: 100.0),
          renderLoginButton(),
        ],
      ),
    );
  }
}

