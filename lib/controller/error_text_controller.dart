import 'package:flutter/cupertino.dart';

class ErrorTextController extends ChangeNotifier {
  String error="";

  void setError(String error){

    this.error=error;
    notifyListeners();
  }

}