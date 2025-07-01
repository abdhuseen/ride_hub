import 'package:flutter/material.dart';

class GenderController extends ChangeNotifier {
  String selectedGender = ''; // default empty
  void setGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
}
