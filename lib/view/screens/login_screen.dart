import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/my_back_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';

import '../app_widgets/inputs/input_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 67.h,
              child: MyBackButton(isFilled: false),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left:24.w, right:24.w, top:50.h),
                  child: SizedBox(
                    width: 380.w,
                    height: 85.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLang.getLang(context: context).sign_in,
                          style: GoogleFonts.mako(
                              fontSize: AppConstants.size2.sp,
                              fontWeight: FontWeight.bold,
                              color: AppConstants.secondaryTextColor1,
                              height: 1
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:6.h),
                          child: Text(
                            AppLang.getLang(context: context).please_enter_your_login_credentials_below,
                            style: GoogleFonts.mulish(
                                fontSize: AppConstants.size8.sp,
                                fontWeight: FontWeight.normal,
                                color: AppConstants.secondaryTextColor6,
                                height: 1
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left:24.w, right:24.w, top:63.h),
                child: SizedBox(
                  width: 380.w,
                  child: Column(
                    children: [
                      InputText(
                        hintText: AppLang.getLang(context: context).phone_number,
                        hintStyle: GoogleFonts.mulish(
                            color: AppConstants.hintTextColor1,
                            fontSize: AppConstants.size8.sp,
                            height: 1
                        ),
                        textInputType: TextInputType.phone,
                        controller: phoneNumberController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:24.h),
                        child: InputText(
                          hintText: AppLang.getLang(context: context).password,
                          hintStyle: GoogleFonts.mulish(
                              color: AppConstants.hintTextColor2,
                              fontSize: AppConstants.size8.sp,
                              height: 1
                          ),
                          textInputType: TextInputType.text,
                          controller: passwordController,
                          isPassword: true,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:6.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TxtButton(
                                  text: AppLang.getLang(context: context).forget_password,
                                  onClick: () {},
                                  textStyle: GoogleFonts.mulish(
                                      color: AppConstants.secondaryTextColor7,
                                      fontSize: AppConstants.size8.sp,
                                      height: 1
                                  )
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:24.w, right:24.w, top:16.h),
                child: PrimaryButton(
                    text: AppLang.getLang(context: context).sign_in_btn,
                    onClick: () {
                      //login functionality
                    }
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left:27.w, right:21.w, top:26.h),
                  child: Row(
                    children: [
                      Text(
                        AppLang.getLang(context: context).not_registered,
                        style: GoogleFonts.mulish(
                            fontSize: AppConstants.size6.sp,
                            height: 1,
                            color: AppConstants.hintTextColor2
                        ),
                      ),
                      TxtButton(
                          text: AppLang.getLang(context: context).create_an_account,
                          onClick: () {
                            //sign-up functionality
                          },
                          textStyle: GoogleFonts.mulish(
                              fontSize: AppConstants.size6.sp,
                              height: 1,
                              color: AppConstants.primaryColor
                          )
                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }
}