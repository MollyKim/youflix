import 'package:flutter/material.dart';
import 'package:youflix/components/text_field/password_text_field.dart';
import 'package:youflix/controllers/RegisterController.dart';
import 'package:youflix/models/internal_models/login_form_model.dart';
import 'package:youflix/components/exports_text_field.dart';
import 'package:youflix/layouts/exports_layouts.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

/*
 * 작성일 : 2021-03-15
 * 작성자 : 김명희
 * 화면명 : HR_0001
 * 주요기능 : 회원가입
 */

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formModel = LoginFormModel();
  bool isFormLoading = false;
  //GlobalKey<ScaffoldState> formKey = new GlobalKey();
  final formKey = GlobalKey<FormState>();

  renderLogo() {
    return Center(
      child: Text("회원가입",style: TextStyle(color: Colors.white, fontSize: 30),)
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
          onSaved: formModel.setPassword,
        )
      ],
    );
  }

  renderLoginButton() {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(6.0),
            child: InkWell(
              onTap: this.isFormLoading ? null : () async{
                if(formKey.currentState.validate()) {
                  formKey.currentState.save();
                  // setState(() {
                  //   this.isFormLoading = true;
                  // });

                  /// 세이브 하기전에 비밀번호 암호화하기
                  try {
                    //암호화된 패스워드 넘겨줌

                    await Get.find<RegisterController>()
                        .loginUser(email: formModel.email, password: formModel.password);

                    setState(() {
                      this.isFormLoading = false;
                    });

                    //Get.toNamed('/main');
                  } on DioError catch (e) {
                    Get.snackbar('회원가입 실패', e.response.data['resultMsg']);
                    setState(() {
                      this.isFormLoading = false;
                    });
                  }
                }
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text( '회원가입', style: TextStyle(color: Colors.white), ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  renderRegisterButton(String title, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title,
            style: TextStyle(decoration: TextDecoration.underline, color: Colors.white),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            renderLogo(),
            Container(height: 150.0),
            renderAuthField(),
            Container(height: 50.0),
            renderLoginButton(),
          ],
        ),
      ),
    );
  }
}


