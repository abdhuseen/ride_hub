import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/controller/error_text_controller.dart';
import 'package:ride_hub/controller/login_controller.dart';
import 'package:ride_hub/validations/password_validations.dart';

class InputText extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isMini;
  final bool isConfirmPassword;

   const InputText({
    super.key,
    required this.hintText,
    required this.hintStyle,
    required this.textInputType,
    this.isPassword = false,
    this.controller,
     this.isMini=false,
     this.isConfirmPassword=false

  });

  @override
  Widget build(BuildContext context) {
    return isPassword ? passwordInputField() : normalInputField();
  }

  Widget normalInputField() {
    return Consumer<ErrorTextController>(
      builder: (context, errorTextController, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: isMini ? 177.w : 380.w,
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color: AppConstants.backgroundColor4,
                  width:1,
                ),
              ),
              child: TextField(
                controller: controller,
                keyboardType: textInputType,
                onChanged: (value) {
                  //validation logic — adjust as needed
                },
                style: TextStyle(
                  fontSize: AppConstants.size8,
                  color: AppConstants.primaryTextColor2,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  border: InputBorder.none,
                ),
              ),
            ),
            if (errorTextController.error.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 12.w),
                child: Text(
                  errorTextController.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: AppConstants.size7,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget passwordInputField() {
    return Consumer2<LoginController, ErrorTextController>(
      builder: (context, loginController, errorTextController, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 380.w,
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color: AppConstants.backgroundColor4,
                  width: 1,
                ),
              ),
              child: TextField(
                controller: controller,
                obscureText: !isConfirmPassword
                    ? loginController.isObscure
                    : loginController.isObscure2,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  bool isEmpty = PasswordValidations.isPasswordEmpty(value);
                  bool isCorrectFormat = PasswordValidations.isCorrectPasswordFormat(value);
                  String error = isEmpty
                      ? "Empty field not allowed here"
                      : !isCorrectFormat
                      ? "Incorrect password format"
                      : "";
                  errorTextController.setError(error);
                },
                style: TextStyle(
                  fontSize: AppConstants.size8,
                  color: AppConstants.primaryTextColor2,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isConfirmPassword == false) {
                        loginController.changePasswordVisibility();
                      } else {
                        loginController.changeConfirmPasswordVisibility();
                      }
                    },
                    icon: !isConfirmPassword
                        ? loginController.isObscure
                        ? const Icon(Icons.visibility_off)
                        : Image.asset(
                      "assets/icons/open_eye_icon.png",
                      width: 24.w,
                      height: 24.w,
                    )
                        : loginController.isObscure2
                        ? const Icon(Icons.visibility_off)
                        : Image.asset(
                      "assets/icons/open_eye_icon.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
              ),
            ),
            if (errorTextController.error.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 12.w),
                child: Text(
                  errorTextController.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: AppConstants.size9, // or any appropriate size
                  ),
                ),
              ),
          ],
        );
      },
    );
  }


}
