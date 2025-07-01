import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/controller/widgets_controller/gender_controller.dart';
import 'package:ride_hub/controller/widgets_controller/upload_image_controller.dart';
import 'package:ride_hub/validations/age_validations.dart';
import 'package:ride_hub/validations/email_validations.dart';
import 'package:ride_hub/validations/full_name_validations.dart';
import 'package:ride_hub/validations/gender_validations.dart';
import 'package:ride_hub/validations/password_validations.dart';
import 'package:ride_hub/validations/phone_number_validations.dart';
import 'package:ride_hub/validations/photo_validation.dart';
import 'package:ride_hub/view/app_widgets/buttons/gender_box_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/upload_image_box.dart';
import 'package:ride_hub/view/screens/authentication_screens/login_screen.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../app_widgets/buttons/my_back_button.dart';
import '../../app_widgets/buttons/txt_button.dart';
import '../../app_widgets/inputs/input_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

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
        child:LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child:Center(
                child:ConstrainedBox(
                  constraints:BoxConstraints(
                    maxWidth:500.w, // cap width for tablets/landscape
                  ),
                  child:Column(
                    children: [
                      // create account title
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 16.h,
                        ),
                        child: Text(
                          AppLang.getLang(context: context).create_account,
                          style: GoogleFonts.mako(
                            fontSize: AppConstants.size1.sp,
                            fontWeight: FontWeight.w400,
                            color: AppConstants.secondaryTextColor1,
                            height: 1,
                          ),
                        ),
                      ),
                      // phone number
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 63.h),
                        child: InputText(
                          hintText:
                          AppLang.getLang(context: context).phone_number,
                          hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            color: AppConstants.hintTextColor1,
                            fontSize: AppConstants.size8.sp,
                            height: 1,
                          ),
                          textInputType: TextInputType.phone,
                          controller: phoneNumberController,
                          indexOfInputField:1,
                        ),
                      ),
                      // email
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: InputText(
                          hintText: AppLang.getLang(context: context).email,
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
                      // password
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: InputText(
                          hintText: AppLang.getLang(context: context).password,
                          hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            color: AppConstants.hintTextColor2,
                            fontSize: AppConstants.size8.sp,
                            height: 1,
                          ),
                          textInputType: TextInputType.text,
                          controller: passwordController,
                          isPassword: true,
                          indexOfInputField:8,
                        ),
                      ),
                      // full name
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: InputText(
                          hintText:
                          AppLang.getLang(context: context).full_name,
                          hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            color: AppConstants.hintTextColor1,
                            fontSize: AppConstants.size8.sp,
                            height: 1,
                          ),
                          textInputType: TextInputType.text,
                          controller: fullNameController,
                          indexOfInputField:2,
                        ),
                      ),
                      // gender box
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: SizedBox(
                          height: 56.h,
                          child: GenderBoxButton(),
                        ),
                      ),
                      // age
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: InputText(
                          hintText: AppLang.getLang(context: context).age,
                          hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            color: AppConstants.hintTextColor1,
                            fontSize: AppConstants.size8.sp,
                            height: 1,
                          ),
                          textInputType: TextInputType.number,
                          controller: ageController,
                          indexOfInputField:3,
                        ),
                      ),
                      // license image
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: SizedBox(
                          height: 56.h,
                          child:UploadImageBox(
                            hintText:AppLang.getLang(context: context).car_license_image,
                             flag:1,
                          ),
                        ),
                      ),
                      // id image
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 24.h),
                        child: SizedBox(
                          height: 56.h,
                          child: UploadImageBox(
                            hintText:
                            AppLang.getLang(context: context).id_image,
                            flag:0,
                          ),
                        ),
                      ),
                      // create account button
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 36.h),
                        child: PrimaryButton(
                          text: AppLang.getLang(context: context).create,
                          onClick: () {
                            //get data
                            String phoneNumber=phoneNumberController.text.trim();
                            String email=emailController.text.trim();
                            String password=passwordController.text.trim();
                            String fullName=fullNameController.text.trim();
                            String gender=Provider.of<GenderController>(context,listen:false).selectedGender;
                            String age=ageController.text.trim();
                            UploadImageController uploadImageController=Provider.of<UploadImageController>(context,listen:false);
                            String idFrontImagePath=uploadImageController.idFrontImagePath;
                            String idBackImagePath=uploadImageController.idBackImagePath;
                            String licenseFrontImagePath=uploadImageController.licenseFrontImagePath;
                            String licenseBackImagePath=uploadImageController.licenseBackImagePath;
                            //check validity
                            bool isPhoneNumberValid=PhoneNumberValidations.isValidPhoneNumber(phoneNumber);
                            bool isEmailValid=EmailValidations.isValidEmail(email);
                            bool isPasswordValid=PasswordValidations.isValidPassword(password);
                            bool isFullNameValid=FullNameValidations.isValidFullName(fullName);
                            bool isGenderValid=GenderValidations.isValidGender(gender);
                            bool isAgeValid=AgeValidations.isValidAge(age);
                            bool isIdFrontImageValid=PhotoValidation.isValidPhoto(idFrontImagePath);
                            bool isIdBackImageValid=PhotoValidation.isValidPhoto(idBackImagePath);
                            bool isLicenseFrontImageValid=PhotoValidation.isValidPhoto(licenseFrontImagePath);
                            bool isLicenseBackImageValid=PhotoValidation.isValidPhoto(licenseBackImagePath);
                            bool isValidForSignUp=isPhoneNumberValid&&isEmailValid&&isPasswordValid&&isFullNameValid&&
                            isGenderValid&&isAgeValid&&isIdFrontImageValid&&isIdBackImageValid&&isLicenseFrontImageValid&&
                            isLicenseBackImageValid;

                            if(isValidForSignUp){
                              //send data to server to create new account and then navigate to login
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));

                            }else{
                              //display invalid messages


                            }








                          },
                        ),
                      ),
                      // already have account
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 16.h, bottom: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLang.getLang(context: context).have_account,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: AppConstants.size6.sp,
                                height: 1,
                                color: AppConstants.hintTextColor2,
                              ),
                            ),
                            TxtButton(
                              text: AppLang.getLang(context: context).login,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              textStyle: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: AppConstants.size6.sp,
                                height: 1,
                                color: AppConstants.primaryColor,
                              ),
                            )
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
