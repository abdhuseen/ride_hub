import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/controller/login_controller.dart';

class InputText extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isMini;

   const InputText({
    super.key,
    required this.hintText,
    required this.hintStyle,
    required this.textInputType,
    this.isPassword = false,
    this.controller,
     this.isMini=false

  });

  @override
  Widget build(BuildContext context) {
    return isPassword ? passwordInputField() : normalInputField();
  }

  Widget normalInputField() {
    return Container(
      width:isMini?177.w:380.w,
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
        keyboardType:textInputType,
        style:TextStyle(
          fontSize: AppConstants.size8,
          color:AppConstants.primaryTextColor2
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget passwordInputField() {
    return Container(
      width: 380.w,
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: AppConstants.backgroundColor4,
          width: 1,
        ),
      ),
      child:Consumer<LoginController>(builder:(context,loginController, child) {
        return TextField(
          controller: controller,
          obscureText:loginController.isObscure,
          keyboardType:TextInputType.text,
          style: TextStyle(
              fontSize:AppConstants.size8,
              color:AppConstants.primaryTextColor2
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            hintText: hintText,
            hintStyle: hintStyle,
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed:(){
                loginController.changePasswordVisibility();
              },
              icon:loginController.isObscure
                  ? const Icon(Icons.visibility_off)
                  : Image.asset(
                "assets/icons/open_eye_icon.png",
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
        );
      },)

    );
  }

}
