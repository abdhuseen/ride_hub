import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  int width;
   SecondaryButton({
    super.key,
    required this.text,
    required this.onClick,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width.w,
      height:40.h,
      child:ElevatedButton(
        onPressed:onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor:AppConstants.secondaryColor2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child:Text(
            text,
            style:GoogleFonts.inter(
              color:AppConstants.secondaryTextColor10,
              fontSize:AppConstants.size6.sp,
              fontWeight:FontWeight.w400,
              height:1
            ),
        ),
      ),
    );
  }
}
