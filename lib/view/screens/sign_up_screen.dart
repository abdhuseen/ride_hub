import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/view/app_widgets/buttons/gender_box_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/upload_image_box.dart';
import 'package:ride_hub/view/screens/login_screen.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_lang.dart';
import '../app_widgets/buttons/my_back_button.dart';
import '../app_widgets/buttons/txt_button.dart';
import '../app_widgets/inputs/input_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //back button
      appBar:AppBar(
        leading:Padding(
          padding: EdgeInsets.only(left: 24.w),
          child:SizedBox(
            height: 67.h,
            child:MyBackButton(isFilled: false),
          ),
        ),
      ),
      body:SafeArea(child:SingleChildScrollView(
        child:Column(
          children: [
            //create account title
            Padding(
              padding: EdgeInsets.only(left:24.w,right:24.w,top:16.h),
              child: Text(
                AppLang.getLang(context: context).create_account,
                style: GoogleFonts.mako(
                    fontSize: AppConstants.size1.sp,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.secondaryTextColor1,
                    height: 1
                ),
              ),



            ),
            //phone number input text
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:63.h),
              child:InputText(
                hintText: AppLang.getLang(context: context).phone_number,
                hintStyle:GoogleFonts.mulish(
                    fontWeight:FontWeight.w400,
                    color: AppConstants.hintTextColor1,
                    fontSize: AppConstants.size8.sp,
                    height: 1
                ),
                textInputType:TextInputType.phone,
                controller: phoneNumberController,
              ),
            ),
            //email input text
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:InputText(
                hintText: AppLang.getLang(context: context).email,
                hintStyle:GoogleFonts.mulish(
                    fontWeight:FontWeight.w400,
                    color: AppConstants.hintTextColor1,
                    fontSize: AppConstants.size8.sp,
                    height: 1
                ),
                textInputType:TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            //password  input text
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
            child:InputText(
              hintText: AppLang.getLang(context: context).password,
              hintStyle: GoogleFonts.mulish(
                  fontWeight:FontWeight.w400,
                  color: AppConstants.hintTextColor2,
                  fontSize: AppConstants.size8.sp,
                  height: 1
              ),
              textInputType: TextInputType.text,
              controller:passwordController,
              isPassword: true,
            ),
            ),
            //full name input text
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:InputText(
                hintText: AppLang.getLang(context: context).full_name,
                hintStyle: GoogleFonts.mulish(
                    fontWeight:FontWeight.w400,
                    color:AppConstants.hintTextColor1,
                    fontSize:AppConstants.size8.sp,
                    height: 1
                ),
                textInputType:TextInputType.text,
                controller:fullNameController,
              ),
            ),
            //gender box
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:SizedBox(
                height:56.h,
                child:GenderBoxButton(),

              )
            ),
            //age input text
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:InputText(
                hintText:AppLang.getLang(context: context).age,
                hintStyle: GoogleFonts.mulish(
                    fontWeight:FontWeight.w400,
                    color:AppConstants.hintTextColor1,
                    fontSize:AppConstants.size8.sp,
                    height:1
                ),
                textInputType:TextInputType.number,
                controller:ageController,
              ),
            ),
            //upload license image
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:SizedBox(
                height:56.h,
                child:UploadImageBox(hintText:AppLang.getLang(context: context).car_license_image),
              ),
            ),
            //upload id image
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:24.h),
              child:SizedBox(
                height:56.h,
                child:UploadImageBox(hintText:AppLang.getLang(context: context).id_image),
              ),
            ),
            //create account button
            Padding(padding:EdgeInsets.only(left:24.w,right:24.h,top:36.h),
              child:PrimaryButton(text:AppLang.getLang(context: context).create, onClick:(){



              })
            ),
            //have an account hint with login button
            Padding(
                padding: EdgeInsets.only(left:24.w, right:24.w, top:16.h),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    //hint text
                    Text(
                      AppLang.getLang(context: context).have_account,
                      style: GoogleFonts.mulish(
                        fontWeight:FontWeight.w400,
                          fontSize: AppConstants.size6.sp,
                          height:1,
                          color: AppConstants.hintTextColor2
                      ),
                    ),
                    //create account button
                    TxtButton(
                        text: AppLang.getLang(context: context).login,
                        onClick: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginScreen(),));

                        },
                        textStyle: GoogleFonts.mulish(
                            fontWeight:FontWeight.w400,
                            fontSize: AppConstants.size6.sp,
                            height: 1,
                            color:AppConstants.primaryColor
                        )
                    )
                  ],
                )
            )

          ],
        ),


      )),


    );
  }
}
