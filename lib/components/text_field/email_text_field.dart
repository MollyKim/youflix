import 'package:flutter/material.dart';
import 'package:youflix/utils/validators.dart';
import 'package:youflix/components/exports_text_field.dart';

class EmailTextField extends StatefulWidget {
  final bool suffixDomain;
  final ValueSetter<String> onSaved;
  final bool isBlack;

  const EmailTextField({
    this.suffixDomain = false,
    @required this.onSaved,
    this.isBlack = true,
  });


  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
      return renderBaseTextFormField();
  }

  renderBaseTextFormField() {
    return UnderlineTextFormField(
      validator: Validators.emailValidator,
      isBlack: widget.isBlack,
      onSaved: widget.onSaved,
      labelText: '이메일',
      hintText: '정확한 이메일을 입력해주세요',
      // actionText: '이메일 만들기',
      // onActionTap: () {
      //   Get.toNamed('/auth/register/email');
      // },
    );
  }

}
