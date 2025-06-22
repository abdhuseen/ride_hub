import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {

  int counterValue=0;

  void increaseCounter(){
    counterValue++;
    notifyListeners();
  }

  void decreaseCounter(){
    if(counterValue>0){
      counterValue--;
    }

    notifyListeners();
  }

}