import 'package:flutter/cupertino.dart';

class ResonsEvaluationWidgetController extends ChangeNotifier{

  List<int>selectedIndices=[];

  void addIndex(int index){
    selectedIndices.add(index);
    notifyListeners();
  }

  void removeIndex(int index){
    selectedIndices.remove(index);
    notifyListeners();
  }


}