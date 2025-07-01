import 'package:flutter/cupertino.dart';

class StarRattingWidgetController extends ChangeNotifier{
 //length of filled represent the star count
  List<int>filledIndices=[];
  void addIndex(int index){
      filledIndices.add(index);
      notifyListeners();
  }
  void removeIndex(int index){
    filledIndices.remove(index);
    notifyListeners();
  }

  void getStarCount()=>filledIndices.length;


}