class AgeValidations {
  static bool isAgeEmpty(String age)=>age.isEmpty;
  static bool isCorrectAgeRange(String age) {
    int userAge=int.parse(age);
    return userAge>=18;
  }
  static bool isValidAge(String age)=>!isAgeEmpty(age)&&isCorrectAgeRange(age);

}