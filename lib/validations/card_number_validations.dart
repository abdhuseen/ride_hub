class CardNumberValidations {
  static bool isCardNumberEmpty(String cardNumber)=>cardNumber.isEmpty;
  static bool isCorrectCardNumberFormat(String cardNumber) {
    final RegExp cardRegex = RegExp(r'^\d{16}$');
    return cardRegex.hasMatch(cardNumber);
  }
  static isCardNumberValid(String cardNumber){
    return isCorrectCardNumberFormat(cardNumber)&&!isCardNumberEmpty(cardNumber);
  }

}