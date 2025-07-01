import 'package:flutter/cupertino.dart';

class PaymentMethodSwitchButtonController extends ChangeNotifier{
  /// determine payment method in case cash =0,in case visa =1
  int paymentFlag=0;

  void setPaymentMethod(int flag){
    paymentFlag=flag;
    notifyListeners();
  }





}