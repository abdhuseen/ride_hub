class CvvValidations {
  static bool isCvvEmpty(String cvv)=>cvv.isEmpty;

  static bool isValidCVV(String cvv) {
    final RegExp cvvRegex = RegExp(r'^\d{3,4}$');
    return cvvRegex.hasMatch(cvv);
  }

}