import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';

import '../../controller/widgets_controller/star_ratting_widget_controller.dart';

class StarRattingWidget extends StatelessWidget {
   int numberOfStars;
   bool isEnabled;
   StarRattingWidget({super.key,required this.numberOfStars,this.isEnabled=false});

  @override
  Widget build(BuildContext context) {
    return isEnabled?enabledStars(context):disabledStars();
  }
   Widget enabledStars(BuildContext context) {
     return Consumer<StarRattingWidgetController>(
       builder: (context, starController, child) {
         return Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: List.generate(5, (index) {
             return InkWell(
               onTap: () {
                 if(starController.filledIndices.contains(index)){
                   //filled star
                   starController.removeIndex(index);//make it unfilled
                 }else{
                   //unfilled star
                   starController.addIndex(index);//make it filled star
                 }
               },
               child:starController.filledIndices.contains(index)?Icon(Icons.star, color: AppConstants.starColor,
               ):Icon(Icons.star_border),
             );
           }),
         );
       },
     );
   }

   Widget disabledStars() {
     return Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: List.generate(5, (index) {
         return index < numberOfStars? Icon(
            Icons.star,
           color:AppConstants.starColor,
         ):Icon(Icons.star_border)
         
         ;
       }),
     );
   }
}
