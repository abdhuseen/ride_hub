class ExpriyDateValidations {

  static bool isExpriyDateEmpty(String expiryDate)=>expiryDate.isEmpty;
  static bool isValidExpiryDate(String expiryDate) {
    final RegExp expiryRegex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    return expiryRegex.hasMatch(expiryDate);
  }



}