import 'package:flutter/material.dart';
import 'package:youflix/components/text_field/password_text_field.dart';
import 'package:youflix/controllers/AuthController.dart';
import 'package:youflix/models/internal_models/login_form_model.dart';
import 'package:youflix/components/exports_text_field.dart';
import 'package:youflix/layouts/exports_layouts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
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
  //GlobalKey<ScaffoldState> formKey = new GlobalKey();
  final formKey = GlobalKey<FormState>();

  renderLogo() {
    return Center(
      child: SvgPicture.asset(
        'assets/netflix_app_icon.svg',height: 50,
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
              onTap: () async{
                if(formKey.currentState.validate()) {
                  formKey.currentState.save();

                  try {

                    await Get.find<AuthController>()
                        .loginUser(email: formModel.email, password: formModel.password);


                    //Get.toNamed('/main');
                  } on DioError catch (e) {
                            Get.snackbar(
                                '로그인 실패',
                                e.response.data['resultMsg'],
                                backgroundColor: Colors.white
                            );
                        }
                }
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text( '로그인', style: TextStyle(color: Colors.white), ),
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

  renderBottom() {
    return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            renderRegisterButton('아이디 찾기', () => Get.toNamed('/auth/register')),
            renderRegisterButton('비밀번호 찾기', () => Get.toNamed('/auth/register')),
            renderRegisterButton('회원가입', () => Get.toNamed('/auth/register')),
          ],
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
            Container(height: 50.0),
            renderAuthField(),
            Container(height: 50.0),
            renderLoginButton(),
            renderBottom(),
          ],
        ),
      ),
    );
  }
}

