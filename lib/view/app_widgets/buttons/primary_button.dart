import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:380.w,
      height:58.h,
      child: ElevatedButton(
        onPressed:onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor:AppConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        child:Text(
          text,
          style:GoogleFonts.mulish(
              color:AppConstants.secondaryColor,
              fontSize:AppConstants.size5.sp,
              fontWeight:FontWeight.w400,
              height:1,


          )
        ),
      ),
    );
  }
}
