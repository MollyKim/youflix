import 'package:flutter/material.dart';

class UnderlineTextFormField extends StatefulWidget {

  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isBlack;
  final String actionText;
  final GestureTapCallback onActionTap;
  //비밀번호의 경우 ****로 보임
  final bool obscureText;

  const UnderlineTextFormField({
    @required this.validator,
    @required this.onSaved,
    this.controller,
    this.labelText,
    this.hintText,
    this.isBlack = true,
    this.actionText,
    this.onActionTap,
    this.obscureText = false,
  }) ;

  @override
  _UnderlineTextFormFieldState createState() => _UnderlineTextFormFieldState();
}

class _UnderlineTextFormFieldState extends State<UnderlineTextFormField> {
  TextEditingController controller;
  UnderlineInputBorder border;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      controller = TextEditingController();
    }else{
      controller = widget.controller;
    }
  }

  renderLabel() {
    if(widget.labelText != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.labelText,style: TextStyle(color: Colors.white),),
          if(widget.actionText != null)
            renderAction(),
        ],
      );
    } else
      return Container();
  }

  renderSuffixIcon(){
    return GestureDetector(
      onTap: (){
        controller.clear();
      },
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD8D8D8),
        ),
        child: Icon(
          Icons.close,
          size: 10.0,
          color: Colors.white,
        ),
      ),
    );
  }

  renderTextField() {
    final baseInputDecoration = InputDecoration(
      border: this.border,
      enabledBorder: this.border,
      focusedBorder: this.border,
      hintText: widget.hintText,
      hintStyle: TextStyle(color: Colors.grey),
      suffix: renderSuffixIcon(),
    );

    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      validator: widget.validator,
      onSaved: widget.onSaved,
      obscureText: widget.obscureText,
      decoration: baseInputDecoration,
    );
  }

  renderAction() {
    if(widget.actionText != null){
      return InkWell(
        onTap: widget.onActionTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 4.0,
            ),
            child: Text(
              widget.actionText,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    border = UnderlineInputBorder(
      borderSide: BorderSide(
        color:  Color(0xFF878787),
      ),
    );
    return Column(
      children: [
        renderLabel(),
        renderTextField(),
      ],
    );
  }
}
