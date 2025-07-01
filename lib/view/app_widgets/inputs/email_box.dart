import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/validations/email_validations.dart';
import 'package:ride_hub/view/app_widgets/buttons/secondary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/main_box.dart';
import 'package:ride_hub/view/screens/authentication_screens/verify_screen.dart';

import '../../../controller/widgets_controller/error_text_controller.dart';
import 'input_text.dart';

class EmailBox extends StatelessWidget {
  EmailBox({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainBox(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:58.h,
            ),
            //email label
            Padding(
              padding:EdgeInsets.only(left:24.w,right:24.h),
            child:Text(AppLang.getLang(context: context).email,
              style:GoogleFonts.inter(
                  fontWeight:FontWeight.w400,
                  fontSize:AppConstants.size6.sp,
                  height:1,
                  color:AppConstants.secondaryTextColor3
              ),
            ),
            ),
            //email input text
            Padding(
              padding:EdgeInsets.only(left:19.w,right:19.h,top:5.h),
              child:InputText(
                hintText:
                AppLang.getLang(context: context).email,
                hintStyle: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  color: AppConstants.hintTextColor1,
                  fontSize: AppConstants.size8.sp,
                  height: 1,
                ),
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                indexOfInputField:0,
              ),
            ),
            //functional buttons
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                //cancel button
                TxtButton(text:AppLang.getLang(context: context).cancel_btn,onClick: () {
                  Navigator.pop(context);

                },textStyle:GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: AppConstants.secondaryTextColor9,
                  fontSize: AppConstants.size6.sp,
                  height: 1,
                ),),
                //send button
                SecondaryButton(text:AppLang.getLang(context: context).send_btn, onClick:(){
                  //get data
                  String email=emailController.text;
                  //check validity
                  bool isEmailValid=EmailValidations.isValidEmail(email);
                  if(isEmailValid){
                    //send email to server and check if it is exist
                    //in case exist
                    Navigator.push(context,MaterialPageRoute(builder:(context) =>VerifyScreen(),));


                  }else{
                    //display invalid email
                    print("invalid email");
                  }





                },width:63)


              ],
            ),
            SizedBox(height:58.h,)
          ],


        ),


    );
  }
}
