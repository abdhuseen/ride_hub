class EmailValidations  {

  static bool isEmailEmpty(String email)=>email.isEmpty;
  static bool isCorrectEmailFormat(String email) {
    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(email);
  }
  static bool isValidEmail(String email)=>!isEmailEmpty(email)&&isCorrectEmailFormat(email);







}