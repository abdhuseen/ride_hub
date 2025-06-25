import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/secondary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/main_box.dart';
import 'package:ride_hub/view/screens/update_password_screen.dart';
import 'input_text.dart';

class VerifyBox extends StatelessWidget {
  VerifyBox({super.key});
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainBox(
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:47.h,
          ),
          //verify label
          Padding(
            padding:EdgeInsets.only(left:24.w,right:24.h),
            child:Text(AppLang.getLang(context: context).a_4_digit_code_has_been_sent_to_your_email_please_enter_it_to_verify,
              style:GoogleFonts.inter(
                  fontWeight:FontWeight.w400,
                  fontSize:AppConstants.size6.sp,
                  height:1.4,
                  color:AppConstants.hintTextColor4
              ),
            ),
          ),
          //otp code input text
          Padding(
            padding:EdgeInsets.only(left:18.w,right:18.h,top:4.h),
            child:InputText(
              hintText:
              AppLang.getLang(context: context).code,
              hintStyle: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                color: AppConstants.hintTextColor1,
                fontSize: AppConstants.size8.sp,
                height: 1,
              ),
              textInputType: TextInputType.number,
              controller:otpController,
            ),
          ),
          SizedBox(height:24.h,),
          //verify button
            Center(
              child:SecondaryButton(text:AppLang.getLang(context: context).verify_btn, onClick:(){
                //get data
                String userOTP=otpController.text.trim();
                //check validity
                if(userOTP.isNotEmpty){
                  //get server OTP and check it with the user entered OTP
                  String serverOTP="1234";//will get from api
                  if(userOTP==serverOTP){
                    Navigator.push(context,MaterialPageRoute(builder:(context) =>UpdatePasswordScreen(),));

                  }else{
                    print("wrong OTP");
                  }

                }else{
                  print("invalid empty OTP");
                }





              },width:68),
            )
        ],


      ),


    );
  }
}
