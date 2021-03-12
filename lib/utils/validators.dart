class Validators {
  static bool isEmail(String mail) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail);

  static String emailValidator(String val) {
    if(val.isEmpty)
      return '이메일을 입력해 주세요';
    else
      return null;
  }

  static String passwordValidator(String val) {
    if(val.isEmpty)
      return '비밀번호를 입력해 주세요';
    else if(val.length<7)
      return '8글자이상 입력해 주세요';
    return null;
  }

}