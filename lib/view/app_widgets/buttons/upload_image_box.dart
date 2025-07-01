import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/view/screens/authentication_screens/upload_image_screen.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
/// hint with upload button and from it specify the photo for id or license
class UploadImageBox extends StatelessWidget {
  String hintText;
  int flag;
   UploadImageBox({super.key,required this.hintText,required this.flag});

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
            //upload  photos, flag 0 for id, 1 for license
            Navigator.push(context,MaterialPageRoute(builder:(context) =>UploadImageScreen(title:flag==1?AppLang.getLang(context: context).license_image:
                AppLang.getLang(context: context).id_image
                , flag:flag),));


          }, icon:Icon(Icons.upload_file,),
          )

        ],
      ),


    );
  }
}
