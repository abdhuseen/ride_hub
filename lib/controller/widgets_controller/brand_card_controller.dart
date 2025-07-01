import 'package:flutter/cupertino.dart';

class BrandCardController extends ChangeNotifier{
  ///selected brands by index
  List<int> selectedBrand=[];

  void selectBrand(int index){
    selectedBrand.add(index);
    notifyListeners();
  }

  void unSelectBrand(int index){
    selectedBrand.remove(index);
    notifyListeners();
  }

  void reset(){
     selectedBrand=[];
    notifyListeners();
  }



}