import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';

import '../../controller/widgets_controller/range_slider_controller.dart';

class MinMaxSlider extends StatelessWidget {
  bool isForPrice;
   MinMaxSlider({super.key,this.isForPrice=true});

  @override
  Widget build(BuildContext context) {
    double step = isForPrice ? 500 : 1;
    return Consumer<RangeSliderController>(builder:(context,rangeSliderController, child) {
      return RangeSlider(
         values:isForPrice?rangeSliderController.priceRangeValues:rangeSliderController.rateRangeValues,
          onChanged:(value) {
           if(isForPrice){
             rangeSliderController.setPriceRangeValues(value);
           }else{
             rangeSliderController.setRateRangeValues(value);
           }

          },
        activeColor:AppConstants.primaryColor,
        inactiveColor:AppConstants.backgroundColor10,
        min: isForPrice ? 500 : 0,
        max: isForPrice ? 200000 : 5,
        divisions:step.toInt(),
        labels: RangeLabels(
          isForPrice
              ? rangeSliderController.priceRangeValues.start.toInt().toString()
              : rangeSliderController.rateRangeValues.start.toStringAsFixed(1),
          isForPrice
              ? rangeSliderController.priceRangeValues.end.toInt().toString()
              : rangeSliderController.rateRangeValues.end.toStringAsFixed(1),
        ),




      );

    },);
  }
}
