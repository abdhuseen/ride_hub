class PhoneNumberValidations {

  static bool isPhoneNumberEmpty(String phoneNumber)=>phoneNumber.isEmpty;
  static bool isCorrectPhoneNumberFormat(String phone) {
    final RegExp phoneRegex = RegExp(
        r"^009627[789]\d{7}$"
    );
    return phoneRegex.hasMatch(phone);
  }
  static bool isValidPhoneNumber(String phoneNumber)=>!isPhoneNumberEmpty(phoneNumber)&&isCorrectPhoneNumberFormat(phoneNumber);



}