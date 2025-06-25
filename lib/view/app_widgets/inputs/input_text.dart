import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/error_text_controller.dart';
import 'package:ride_hub/controller/login_controller.dart';
import 'package:ride_hub/validations/age_validations.dart';
import 'package:ride_hub/validations/card_holder_name_validations.dart';
import 'package:ride_hub/validations/card_number_validations.dart';
import 'package:ride_hub/validations/cvv_validations.dart';
import 'package:ride_hub/validations/email_validations.dart';
import 'package:ride_hub/validations/expriy_date_validations.dart';
import 'package:ride_hub/validations/full_name_validations.dart';
import 'package:ride_hub/validations/password_validations.dart';
import 'package:ride_hub/validations/phone_number_validations.dart';

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
    this.isMini = false,
    this.isConfirmPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return isPassword ? passwordInputField(context) : normalInputField(context);
  }

  Widget normalInputField(BuildContext context) {
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
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            onChanged: (value) {
              _handleValidation(context, value);
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
        /*if (errorController.error.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 12.w),
            child: Text(
              errorController.error,
              style: TextStyle(
                color: Colors.red,
                fontSize: AppConstants.size9.sp,
              ),
            ),
          ),*/
      ],
    );
  }

  Widget passwordInputField(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, loginController, child) {
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
                  bool isPasswordEmpty =
                  PasswordValidations.isPasswordEmpty(value);
                  bool passwordHasCorrectFormat =
                  PasswordValidations.isCorrectPasswordFormat(value);
                  String error = isPasswordEmpty
                      ? AppLang.getLang(context: context)
                      .empty_field_error_msg
                      : !passwordHasCorrectFormat
                      ? AppLang.getLang(context: context)
                      .password_valid_format_error_msg
                      : "";
                  //errorController.setError(error);
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
                      if (!isConfirmPassword) {
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
            /*if (errorController.error.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 12.w),
                child: Text(
                  errorController.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: AppConstants.size9.sp,
                  ),
                ),
              ),*/
          ],
        );
      },
    );
  }

  void _handleValidation(BuildContext context, String value) {
    final lang = AppLang.getLang(context: context);
    String error = "";

    switch (hintText) {
      case "Email":
        bool isEmpty = EmailValidations.isEmailEmpty(value);
        bool isValid = EmailValidations.isCorrectEmailFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.email_valid_format_error_msg
            : "";
        break;

      case "Phone Number":
        bool isEmpty = PhoneNumberValidations.isPhoneNumberEmpty(value);
        bool isValid = PhoneNumberValidations.isCorrectPhoneNumberFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.phone_number_valid_format_error_msg
            : "";
        break;

      case "Full Name":
        bool isEmpty = FullNameValidations.isFullNameEmpty(value);
        bool isValid = FullNameValidations.isCorrectFullNameFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.full_name_or_card_holder_name_valid_format_error_msg
            : "";
        break;

      case "Age":
        bool isEmpty = AgeValidations.isAgeEmpty(value);
        bool isValid = AgeValidations.isCorrectAgeRange(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.age_valid_error_msg
            : "";
        break;

      case "card holder name":
        bool isEmpty = CardHolderNameValidations.isCardHolderNameEmpty(value);
        bool isValid =
        CardHolderNameValidations.isCorrectFormatCardHolderName(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.full_name_or_card_holder_name_valid_format_error_msg
            : "";
        break;

      case "XXXX XXXX XXXX XXXX":
        bool isEmpty = CardNumberValidations.isCardNumberEmpty(value);
        bool isValid =
        CardNumberValidations.isCorrectCardNumberFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.card_number_valid_format_error_msg
            : "";
        break;

      case "06/23":
        bool isEmpty = ExpriyDateValidations.isExpriyDateEmpty(value);
        bool isValid =
        ExpriyDateValidations.isCorrectExpiryDateFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.expriy_date_valid_format_error_msg
            : "";
        break;

      case "XXX":
        bool isEmpty = CvvValidations.isCvvEmpty(value);
        bool isValid = CvvValidations.isCorrectCVVFormat(value);
        error = isEmpty
            ? lang.empty_field_error_msg
            : !isValid
            ? lang.cvv_valid_format_error_msg
            : "";
        break;

      default:
        bool isEmpty = value.isEmpty;
        error = isEmpty ? lang.empty_field_error_msg : "";
        break;
    }

    //errorController.setError(error);
  }
}
