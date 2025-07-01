import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../model/car.dart';


class CarCapabilitiesScreen extends StatelessWidget {
  Car car;
  CarCapabilitiesScreen({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children: [
            //Capabilities title
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                SizedBox(width:24.w,),
                Text(AppLang.getLang(context: context).capabilities,
                  style:GoogleFonts.mulish(
                      fontWeight:FontWeight.w700,
                      fontSize:AppConstants.size5.sp,
                      height:1,
                      color:AppConstants.primaryTextColor
                  ),
                ),
              ],
            ),
            SizedBox(height:12.h,),
            Column(
                  children: [
                    Padding(padding:EdgeInsets.only(left:24.w,right:24.w),
                      child:Container(
                        width:380.w,
                        height:400.h,
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.only(topLeft:Radius.circular(16.r),bottomRight:Radius.circular(16.r)),
                            shape:BoxShape.rectangle,
                            color:AppConstants.backgroundColor7
                        ),
                        child:Column(
                          children: [
                            buildInfoPoint("Engine Type",car.engineType),
                            SizedBox(height:5.h,),
                            buildInfoPoint(AppLang.getLang(context: context).hoers_power,"${car.hoursPower} mpg(city/highway)"),
                            SizedBox(height:5.h,),
                            buildInfoPoint(AppLang.getLang(context: context).transmission_type,car.transmissionType),
                            SizedBox(height:5.h,),
                            buildInfoPoint(AppLang.getLang(context: context).fuel_type,car.fuel),
                          ],
                        ),
                      ),
                    ),

                  ],
                )


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
