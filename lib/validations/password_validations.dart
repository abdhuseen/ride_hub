class PasswordValidations {
  static bool isPasswordEmpty(String password)=>password.isEmpty;
  static bool isCorrectPasswordFormat(String password) {
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])[a-zA-Z0-9_@$]{8,}$'

    );
    return passwordRegex.hasMatch(password);
  }
  static bool isValidPassword(String password)=>!isPasswordEmpty(password)&&isCorrectPasswordFormat(password);




}