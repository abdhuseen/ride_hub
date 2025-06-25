import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/error_text_controller.dart';
import 'package:ride_hub/validations/email_validations.dart';
import 'package:ride_hub/validations/password_validations.dart';
import 'package:ride_hub/view/app_widgets/buttons/my_back_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/screens/forget_password_screen.dart';
import 'package:ride_hub/view/screens/sign_up_screen.dart';
import '../app_widgets/inputs/input_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ErrorTextController emailErrorTextController=ErrorTextController();
  final ErrorTextController passwordErrorTextController=ErrorTextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // back button
      appBar:AppBar(
        leading:Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(
            height: 67.h,
            child: MyBackButton(isFilled: false),
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500.w, // cap width for tablets/landscape
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // sign in title and subtitle
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: constraints.maxHeight > constraints.maxWidth
                              ? 50.h
                              : 24.h, // reduce padding in landscape
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLang.getLang(context: context).sign_in,
                              style: GoogleFonts.mako(
                                fontSize: AppConstants.size2.sp,
                                fontWeight: FontWeight.bold,
                                color: AppConstants.secondaryTextColor1,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              AppLang.getLang(context: context)
                                  .please_enter_your_login_credentials_below,
                              style: GoogleFonts.mulish(
                                fontSize: AppConstants.size8.sp,
                                fontWeight: FontWeight.normal,
                                color: AppConstants.secondaryTextColor6,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // email & password input fields and forget password
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 50.h),
                        child: Column(
                          children: [
                            //email input text
                            InputText(
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
                            ),
                            SizedBox(height:24.h),
                            //password input text
                            InputText(
                              hintText:
                              AppLang.getLang(context: context).password,
                              hintStyle: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                color: AppConstants.hintTextColor2,
                                fontSize: AppConstants.size8.sp,
                                height: 1,
                              ),
                              textInputType: TextInputType.text,
                              controller: passwordController,
                              isPassword: true,
                            ),
                            // forgot password
                            Padding(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TxtButton(
                                    text: AppLang.getLang(context: context)
                                        .forget_password,
                                    onClick: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder:(context) =>ForgetPasswordScreen(),)
                                      );
                                    },
                                    textStyle: GoogleFonts.mulish(
                                      color: AppConstants.secondaryTextColor7,
                                      fontSize: AppConstants.size8.sp,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // sign in button
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 36.h),
                        child: PrimaryButton(
                          text: AppLang.getLang(context: context).sign_in_btn,
                          onClick: () {
                            //get data
                            String email=emailController.text.trim();
                            String password=passwordController.text.trim();

                            //check validity
                            bool isEmailValid=EmailValidations.isValidEmail(email);
                            bool isPasswordValid=PasswordValidations.isValidPassword(password);
                            bool isValidForLogin=isEmailValid&&isPasswordValid;
                            if(isValidForLogin){
                              //send email and password to the server and check if user exist or not
                              //TODO add login api


                            }else{

                              // not valid filed so display message for user


                            }



                          },
                        ),
                      ),

                      // create account text and button
                      Padding(
                        padding: EdgeInsets.only(
                            left: 27.w, right: 21.w, top: 26.h, bottom: 30.h),
                        child: Row(
                          children: [
                            Text(
                              AppLang.getLang(context: context)
                                  .not_registered,
                              style: GoogleFonts.mulish(
                                fontSize: AppConstants.size6.sp,
                                height: 1,
                                color: AppConstants.hintTextColor2,
                              ),
                            ),
                            TxtButton(
                              text: AppLang.getLang(context: context)
                                  .create_an_account,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              textStyle: GoogleFonts.mulish(
                                fontSize: AppConstants.size6.sp,
                                height: 1,
                                color: AppConstants.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
