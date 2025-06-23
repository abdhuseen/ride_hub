import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';

class UploadImageBox extends StatelessWidget {
  String hintText;

   UploadImageBox({super.key,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppConstants.backgroundColor4, width: 1),
      ),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child:Text(
              hintText,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                color: AppConstants.hintTextColor2,
                fontSize: AppConstants.size8.sp,
                height: 1,
              ),
            ),
          ),
          SizedBox(width:10.w),
          IconButton(onPressed:(){

          }, icon:Icon(Icons.upload_file,),
          )

        ],
      ),


    );
  }
}
