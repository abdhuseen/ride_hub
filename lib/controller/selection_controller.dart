import 'package:flutter/cupertino.dart';

class SelectionController extends ChangeNotifier{
  ///this flag determine the user path if is rent_screens a car or buy a car
  ///values 0 in case of rent_screens and 1 in case of buy
  int selectedFlag=-1;

  void changeFlag(int flagValue){
    selectedFlag=flagValue;
    notifyListeners();

  }
}