import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/my_back_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/resons_evaluation_widget.dart';
import 'package:ride_hub/view/app_widgets/star_ratting_widget.dart';

class RattingScreen extends StatelessWidget {
  RattingScreen({super.key});
  TextEditingController summaryExperience=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 67.h,
              child: MyBackButton(isFilled: false),
            ),
        ),
        centerTitle:true,
        title:Text(AppLang.getLang(context: context).car_rating,
        style:GoogleFonts.mulish(
          fontSize:AppConstants.size5.sp,
          fontWeight:FontWeight.w700,
          height:1,
          color:AppConstants.primaryTextColor
        ),
        ),
      ),
      body:SafeArea(child:SingleChildScrollView(
        child:Column(
            children: [
              //reason for evaluations title
              Padding(padding:EdgeInsets.only(left:30.w,top:75.h,right:207.w),child:Text(AppLang.getLang(context: context).reason_for_evaluation,
                style:GoogleFonts.mulish(
                    fontWeight:FontWeight.w700,
                    fontSize:AppConstants.size6.sp,
                    height:1.36,
                    color:AppConstants.secondaryTextColor11

                ),
              ),),
              //choices
              Padding(padding:EdgeInsets.only(left:30.w,top:16.h,right:207.w),
                child:ResonsEvaluationWidget(),
              ),
              //ratting widget
              Padding(padding:EdgeInsets.only(left:40.w,top:33.h,right:207.w),child:StarRattingWidget(numberOfStars:5,isEnabled:true,),),
              //Summary of your experience
              Padding(padding:EdgeInsets.only(left:30.w,top:48.h,right:150.w),child:Text(AppLang.getLang(context: context).summary_of_your_experience,
                style:GoogleFonts.inter(
                    fontWeight:FontWeight.w400,
                    fontSize:AppConstants.size6.sp,
                    height:1.4,
                    color:AppConstants.secondaryTextColor3
                ),
              ),),
              //summary of your experience input text
              Padding(padding:EdgeInsets.only(left:30.w,top:8.h,right:150.w),
                  child:Container(
                    width:400.w,
                    height:200.h,
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8.r),
                        color:AppConstants.secondaryColor,

                    ),
                    child:TextField(
                      controller:summaryExperience,
                      decoration:InputDecoration(
                          contentPadding:EdgeInsets.symmetric(horizontal: 16.w) ,
                          hintText:"Fuel consumption, acceleration, interior space, exterior appearance, extras, price .....",
                          hintStyle:GoogleFonts.inter(
                              fontWeight:FontWeight.w400,
                              fontSize:AppConstants.size6.sp,
                              height:1.4,
                              color:AppConstants.secondaryTextColor3,
                          ),
                        border:InputBorder.none

                      ),
                      maxLines:null,


                    ),
                  )),
              //submit button
              Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:64.h),
              child:PrimaryButton(text:AppLang.getLang(context: context).submit, onClick:(){



              }),
              )
            ]),
      ))
    );
  }
}
