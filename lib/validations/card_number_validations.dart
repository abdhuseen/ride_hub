class CardNumberValidations {
  static bool isCardNumberEmpty(String cardNumber)=>cardNumber.isEmpty;
  static bool isValidCardNumberFormat(String cardNumber) {
    final RegExp cardRegex = RegExp(r'^\d{16}$');
    return cardRegex.hasMatch(cardNumber);
  }

}