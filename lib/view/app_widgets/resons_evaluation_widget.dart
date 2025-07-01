import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';

import '../../controller/widgets_controller/resons_evaluation_widget_controller.dart';

class ResonsEvaluationWidget extends StatelessWidget {
  const ResonsEvaluationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResonsEvaluationWidgetController>(builder:(context,reasonController, child) {
    List<String>reasons=[AppLang.getLang(context: context).general_experience,
    AppLang.getLang(context: context).former_owner,
      AppLang.getLang(context: context).test_drive
    ];
      return Column(
        children:List.generate(3,(index) {
            return InkWell(
              onTap:(){
                if(reasonController.selectedIndices.contains(index)){
                  //this reason selected ,so must be un selected
                  reasonController.removeIndex(index);//be unselected
                }else{
                  //this reason unselected ,so must be  selected
                  reasonController.addIndex(index);//be selected
                }
              },
              child:Column(
                children: [
                  Container(
                      width:170.w,
                      height:40.h,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(8.r),
                          border:Border.all(width:1,
                            color:AppConstants.secondaryColor,
                          ),
                          color:reasonController.selectedIndices.contains(index)?AppConstants.starColor2:AppConstants.backgroundColor2
                      ),
                      child:Center(
                        child:Text(reasons[index],
                          style:GoogleFonts.inter(
                            fontSize:AppConstants.size6.sp,
                            fontWeight:FontWeight.w400,
                            height:1,
                            color:AppConstants.secondaryTextColor10,
                          ),
                          textAlign:TextAlign.center,
                        ),
                      )



                  ),
                  SizedBox(height:12.h,)
                ],
              )
            );
          },),


      );
    },);
  }
}
