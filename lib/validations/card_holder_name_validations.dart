class CardHolderNameValidations {

  static bool isCardHolderNameEmpty(String name)=>name.isEmpty;
  static bool isValidCardHolderName(String name) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');
    return nameRegex.hasMatch(name);
  }

}