import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';

import '../../../model/car.dart';


class CarGeneralInfoScreen extends StatelessWidget {
  Car car;
  CarGeneralInfoScreen({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children: [
            //Mileage ,Seat ,Capacity,Color,Car Number box
            Padding(padding:EdgeInsets.only(left:24.w,right:24.w),
              child:Container(
                width:380.w,
                height:120.h,
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft:Radius.circular(16.r),bottomRight:Radius.circular(16.r)),
                    shape:BoxShape.rectangle,
                    color:AppConstants.backgroundColor7
                ),
                child:Column(
                  children: [
                    buildInfoPoint(AppLang.getLang(context: context).mileage,"${car.mileage} ${AppLang.getLang(context: context).km_balance}"),
                    SizedBox(height:5.h,),
                    buildInfoPoint(AppLang.getLang(context: context).seat_capacity,"${car.seatCapacity} ${AppLang.getLang(context: context).seat}"),
                    SizedBox(height:5.h,),
                    buildInfoPoint(AppLang.getLang(context: context).color,car.color),
                    SizedBox(height:5.h,),
                    buildInfoPoint(AppLang.getLang(context: context).card_number,car.carNumber),
                  ],
                ),
              ),
            ),
            SizedBox(height:25.h,),
            //general information title
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                SizedBox(width:24.w,),
                Text(AppLang.getLang(context: context).general_information,
                  style:GoogleFonts.mulish(
                      fontWeight:FontWeight.w700,
                      fontSize:AppConstants.size5.sp,
                      height:1,
                      color:AppConstants.primaryTextColor
                  ),
                ),
              ],
            ),
            //information box
            Padding(padding:EdgeInsets.only(left:24.w,right:24.w),
              child:Container(
                width:380.w,
                height:120.h,
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft:Radius.circular(16.r),bottomRight:Radius.circular(16.r)),
                    shape:BoxShape.rectangle,
                    color:AppConstants.backgroundColor7
                ),
                child:Text(car.generalInfo,
                  style: GoogleFonts.mulish(
                    fontWeight:FontWeight.w700,
                    fontSize:AppConstants.size8.sp,
                    height:1,
                    color:AppConstants.secondaryTextColor1,

                ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,

                ),

              ),
            ),

          ],

        ),
      )

    );
  }
  
  Widget buildInfoPoint(String label,String value){
    return Padding(padding:EdgeInsets.only(left:10.w,top:7.h),
    child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style:GoogleFonts.mulish(
            fontWeight:FontWeight.w700,
            fontSize:AppConstants.size6.sp,
            height:1,
            color:AppConstants.secondaryTextColor1
        ),),
        Text(value,style:GoogleFonts.mulish(
            fontWeight:FontWeight.w400,
            fontSize:AppConstants.size6.sp,
            height:1,
            color:AppConstants.secondaryTextColor1
        ),)
      ],
    ),
    );
  }
}
