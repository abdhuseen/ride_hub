import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier{
  bool isObscure=true;
  bool isObscure2=true;//confirm password

  void changePasswordVisibility(){
    isObscure=!isObscure;
    notifyListeners();
  }
  void changeConfirmPasswordVisibility(){
    isObscure2=!isObscure2;
    notifyListeners();
  }

}