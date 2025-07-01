import 'package:flutter/material.dart';

class RangeSliderController extends ChangeNotifier {
  RangeValues priceRangeValues =  RangeValues(500, 200000);
  RangeValues rateRangeValues =  RangeValues(0, 5);

  void setPriceRangeValues(RangeValues values) {
    priceRangeValues = values;
    notifyListeners();
  }

  void setRateRangeValues(RangeValues values) {
    rateRangeValues = values;
    notifyListeners();
  }
  void reset(){
    priceRangeValues=RangeValues(500, 200000);
    rateRangeValues=RangeValues(0, 5);
    notifyListeners();
  }
}
