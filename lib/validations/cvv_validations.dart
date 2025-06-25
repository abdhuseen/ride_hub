class CvvValidations {
  static bool isCvvEmpty(String cvv)=>cvv.isEmpty;
  static bool isCorrectCVVFormat(String cvv) {
    final RegExp cvvRegex = RegExp(r'^\d{3,4}$');
    return cvvRegex.hasMatch(cvv);
  }
  static bool isCvvValid(String cvv){
    return !isCvvEmpty(cvv)&&isCorrectCVVFormat(cvv);
  }

}