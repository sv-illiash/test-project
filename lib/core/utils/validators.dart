abstract class Validator {
  bool isValid();
}

class EmailValidator extends Validator {

  final String email;
  EmailValidator(this.email);

  @override
  bool isValid() {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordValidator extends Validator {

  final String password;
  PasswordValidator(this.password);

  @override
  bool isValid() {
    if (password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}

