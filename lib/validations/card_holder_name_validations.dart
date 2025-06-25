class CardHolderNameValidations {

  static bool isCardHolderNameEmpty(String name)=>name.isEmpty;
  static bool isCorrectFormatCardHolderName(String name) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');
    return nameRegex.hasMatch(name);
  }
  static bool isCardHolderNameValid(String name) {
    
    return isCorrectFormatCardHolderName(name)&&!isCardHolderNameEmpty(name);
  }

}