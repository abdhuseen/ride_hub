import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';

class MyBackButton extends StatelessWidget {
  final bool isFilled;

  const MyBackButton({
    super.key,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width:48.w,
        height:48.w,
        decoration: BoxDecoration(
          color: isFilled ? AppConstants.primaryColor:AppConstants.secondaryColor,
          shape:BoxShape.circle,
          border: Border.all(
            color: AppConstants.primaryColor,
            width:1,
          ),
        ),
        child:Center(
          child: Image.asset(
            "assets/icons/back_arrow_icon.png",
            width:24.w,
            height:24.w,
            color: isFilled ? AppConstants.secondaryColor:AppConstants.primaryTextColor2,
          ),
        ),
      ),
    );
  }
}
