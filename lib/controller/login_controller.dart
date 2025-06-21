import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier{
  bool isObscure=true;

  void changePasswordVisibility(){

    isObscure=!isObscure;
    notifyListeners();
  }


}