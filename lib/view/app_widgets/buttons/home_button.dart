import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/view/screens/onboarding_screens/selection_screen.dart';

import '../../../constants/app_constants.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>SelectionScreen(),));
      },
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width:48.w,
        height:48.w,
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          shape:BoxShape.circle,
          border: Border.all(
            color: AppConstants.primaryColor,
            width:1,
          ),
        ),
        child:Center(
          child: Image.asset(
            "assets/icons/home_icon.png",
            width:24.w,
            height:24.w,
          ),
        ),
      ),
    );
  }
}
