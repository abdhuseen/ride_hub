import 'package:flutter/cupertino.dart';

class ErrorTextController extends ChangeNotifier {
  ///error of all validations for input text
  List<String> errors=["","","","","","","","","","",""];

  void setError(String error,int index){

    errors[index]=error;
    notifyListeners();
  }

}