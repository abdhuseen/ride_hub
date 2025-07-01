import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/widgets_controller/drop_down_menu_button_controller.dart';

class DropDownMenuButton extends StatelessWidget {
  const DropDownMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DropDownMenuButtonController>(builder:(context,dropDownMenuButtonController, child) {

      return Row(
        children: [
          //month drop down menu
          Container(
            width:178.w,
            height:40.h,
            decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(16.r),
                border:Border.all(width:1,
                    color:AppConstants.backgroundColor5
                ),
                color:AppConstants.secondaryColor,

            ),
            child:DropdownButtonHideUnderline(
              child:DropdownButton<String>(
                hint:Text(AppLang.getLang(context: context).month,
                  style:GoogleFonts.belleza(
                      fontWeight:FontWeight.w400,
                      fontSize:AppConstants.size8.sp,
                      height:1,
                      color:AppConstants.hintTextColor5
                  ),

                ),
                value:dropDownMenuButtonController.month,
                icon: const Icon(Icons.arrow_drop_down),
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                items:dropDownMenuButtonController.months.map((month) {
                  return DropdownMenuItem<String>(
                    value:month,
                    child:Text(month,
                    style:GoogleFonts.mulish(
                      fontWeight:FontWeight.normal,
                      fontSize:AppConstants.size8.sp,
                      color:AppConstants.primaryTextColor
                    ),
                    ),
                  );
                },).toList()
                , onChanged:(value) {
                dropDownMenuButtonController.setMonth(value??"");


              },),

            ),


          ),
          SizedBox(width:24.w,),
          //years drop down menu
          Container(
            width:178.w,
            height:40.h,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(16.r),
              border:Border.all(width:1,
                  color:AppConstants.backgroundColor5
              ),
              color:AppConstants.secondaryColor,

            ),
            child:DropdownButtonHideUnderline(
              child:DropdownButton<String>(
                hint:Text(AppLang.getLang(context: context).year,
                  style:GoogleFonts.belleza(
                      fontWeight:FontWeight.w400,
                      fontSize:AppConstants.size8.sp,
                      height:1,
                      color:AppConstants.hintTextColor5
                  ),

                ),
                value:dropDownMenuButtonController.year,
                icon: const Icon(Icons.arrow_drop_down),
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                items:dropDownMenuButtonController.years.map((year) {
                  return DropdownMenuItem<String>(
                    value:year,
                    child:Text(year,
                      style:GoogleFonts.mulish(
                          fontWeight:FontWeight.normal,
                          fontSize:AppConstants.size8.sp,
                          color:AppConstants.primaryTextColor
                      ),
                    ),
                  );
                },).toList()
                , onChanged:(value) {
                dropDownMenuButtonController.setYear(value??"");


              },),

            ),


          ),

        ],
      );
    },);
  }
}
