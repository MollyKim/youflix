import 'package:flutter/material.dart';
import 'package:youflix/components/exports_text_field.dart';
import 'package:youflix/utils/validators.dart';

class PasswordTextField extends StatefulWidget {
  final bool isConfirm;
  final ValueSetter<String> onSaved;
  final bool isBalck;

  const PasswordTextField({
    this.isConfirm = false, 
    @required this.onSaved, 
    this.isBalck = true,
  });
  
  
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return UnderlineTextFormField(
      validator: Validators.passwordValidator,
      onSaved: widget.onSaved,
      labelText: '비밀번호',
      isBlack: widget.isBalck,
      obscureText: true,
      hintText: '8글자 이상 입력해주세요',
    );
  }
}


