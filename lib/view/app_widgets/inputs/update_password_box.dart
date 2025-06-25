import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/validations/password_validations.dart';
import 'package:ride_hub/view/app_widgets/buttons/secondary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/main_box.dart';
import 'package:ride_hub/view/screens/login_screen.dart';

import 'input_text.dart';

class UpdatePasswordBox extends StatelessWidget {
  UpdatePasswordBox({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainBox(
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          //new password label
          Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:24.h),
          child:Text(AppLang.getLang(context: context).new_password,
            style:GoogleFonts.plusJakartaSans(
              fontWeight:FontWeight.w500,
              fontSize:AppConstants.size9.sp,
              height:1.6,
              letterSpacing:-0.24,
              color: AppConstants.secondaryTextColor3

            ),

          ),



          ),
          //password input text
          Padding(padding:EdgeInsets.only(left:10.w,right:10.w,top:2.h),
          child:InputText(
            hintText: AppLang.getLang(context: context).value,
            hintStyle: GoogleFonts.mulish(
              fontWeight: FontWeight.w400,
              color: AppConstants.hintTextColor2,
              fontSize: AppConstants.size8.sp,
              height: 1,
            ),
            textInputType:TextInputType.text,
            controller:passwordController,
            isPassword: true,
          ),
          ),
          //confirm password label
          Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:27.h),
            child:Text(AppLang.getLang(context: context).confirm_new_password,
              style:GoogleFonts.plusJakartaSans(
                  fontWeight:FontWeight.w500,
                  fontSize:AppConstants.size9.sp,
                  height:1.6,
                  letterSpacing:-0.24,
                  color: AppConstants.secondaryTextColor3

              ),

            ),



          ),
          //confirm password input field
          Padding(padding:EdgeInsets.only(left:10.w,right:10.w,top:2.h),
            child:InputText(
              hintText: AppLang.getLang(context: context).value,
              hintStyle: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                color: AppConstants.hintTextColor2,
                fontSize: AppConstants.size8.sp,
                height: 1,
              ),
              textInputType:TextInputType.text,
              controller:confirmPasswordController,
              isPassword: true,
              isConfirmPassword:true,
            ),
          ),
          SizedBox(height:12.h,),
          //update button
          Center(
            child:SecondaryButton(text:AppLang.getLang(context: context).update_password, onClick:(){
              //get data
              String password=passwordController.text.trim();
              String confirmPassword=confirmPasswordController.text.trim();
              //check validity
              bool isPasswordValid=PasswordValidations.isValidPassword(password);
              bool isConfirmPasswordValid=PasswordValidations.isValidPassword(confirmPassword);
              bool isValidForUpdate=isPasswordValid&&isConfirmPasswordValid;
              if(isValidForUpdate){
                //check if password nad confirm password are same
                if(password==confirmPassword){
                  //send the new password to the server and then navigate to login screen
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>LoginScreen(),));
                }else{
                  //password and confirm password not equals message
                  print(" password not equal confirm password");

                }
              }else{
                //invalid password message
                print("invalid password or confirm password");
              }


            }, width:272),
          )

        ],


      ),


    );
  }
}
