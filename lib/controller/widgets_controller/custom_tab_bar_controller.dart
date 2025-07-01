import 'package:flutter/cupertino.dart';

class CustomTabBarController extends ChangeNotifier {
  int selectedIndex=0;

  void setSelectedIndex(int index){
    selectedIndex=index;
    notifyListeners();
  }

}