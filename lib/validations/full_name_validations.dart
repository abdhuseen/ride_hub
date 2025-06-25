class FullNameValidations  {

  static bool isFullNameEmpty(String name)=>name.isEmpty;
  static bool isCorrectFullNameFormat(String name) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF ]+$');
    return nameRegex.hasMatch(name);
  }
  static bool isValidFullName(String fullName)=>!isFullNameEmpty(fullName)&&isCorrectFullNameFormat(fullName);







}