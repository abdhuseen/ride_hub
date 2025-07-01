import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {

  int counterValue=1;

  void increaseCounter(){
    counterValue++;
    notifyListeners();
  }

  void decreaseCounter(){
    if(counterValue>1){
      counterValue--;
    }

    notifyListeners();
  }

}