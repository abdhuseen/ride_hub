import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/home_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/screens/selection_screen.dart';

class SuccessfulReservationScreen extends StatelessWidget {
  const SuccessfulReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child:SingleChildScrollView(
        child:Column(

          children: [
            //SuccessfulReservation title
            Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:75.h),child: Center(
              child:Text(AppLang.getLang(context: context).successful_reservation,
                style:GoogleFonts.mulish(
                    fontWeight:FontWeight.w700,
                    fontSize:AppConstants.size5.sp,
                    height:1,
                    color:AppConstants.primaryTextColor2
                ),
              ),
            ),),
            //successful image 
            Padding(padding:EdgeInsets.only(left:63.w,right:62.w,top:50.h),
              child:SizedBox(
                width:303.w,
                height:310.h,
                child:Image.asset("assets/images/successful_payment_image.png"),
                
              ),

            ),
            //hint message
            Padding(padding:EdgeInsets.only(left:25.w,right:24.w,top:46.h),
                    child:Column(
                      children: [
                        //title of the message
                        Text(AppLang.getLang(context: context).successful,
                             style:GoogleFonts.mulish(
                                 fontWeight:FontWeight.w400,
                                 fontSize:AppConstants.size2.sp,
                                 height:1,
                                 color:AppConstants.secondaryTextColor1
                             ),

                        ),
                        Padding(padding:EdgeInsets.only(top:14.h),
                               child:Text(AppLang.getLang(context: context).wait_for_the_galleries_response,
                                 style:GoogleFonts.mulish(
                                     fontWeight:FontWeight.w400,
                                     fontSize:AppConstants.size5.sp,
                                     height:1,
                                     color:AppConstants.secondaryTextColor8
                                 ),

                               ),
                        )


                      ],
                    ),


            ),
            //back to home button
        Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:67.h),
               child:PrimaryButton(text:AppLang.getLang(context: context).back_to_home, onClick:(){

                 Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>SelectionScreen(),));

               }),


        )
              


          ],
        ),

      )),



    );
  }
}
