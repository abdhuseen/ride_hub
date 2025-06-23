import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../controller/gender_controller.dart';


class GenderBoxButton extends StatelessWidget {
  const GenderBoxButton({super.key});

  @override
  Widget build(BuildContext context) {
    final genderController = Provider.of<GenderController>(context);

    return Container(
      width: 380.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: AppConstants.backgroundColor4,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          FittedBox(
            child:Text(
              AppLang.getLang(context: context).gender,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                color: AppConstants.hintTextColor2,
                fontSize: AppConstants.size8.sp,
                height: 1,
              ),
            ),
          ),
          SizedBox(width:10.w),
          Expanded(
            child: Row(
              children: [
                Radio<String>(
                  value:'male',
                  groupValue:genderController.selectedGender,
                  onChanged:(value) {
                    if (value != null) {
                      genderController.setGender(value);
                    }
                  },
                  activeColor:AppConstants.primaryColor,
                ),
                FittedBox(
                  child:Text(
                    AppLang.getLang(context: context).male,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      color: AppConstants.primaryTextColor,
                      fontSize: AppConstants.size9.sp,
                    ),
                  ),
                ),
                SizedBox(width:10.w),
                Radio<String>(
                  value:'female',
                  groupValue:genderController.selectedGender,
                  onChanged: (value) {
                    if (value != null) {
                      genderController.setGender(value);
                    }
                  },
                  activeColor: AppConstants.primaryColor,
                ),
                FittedBox(
                  child: Text(
                    AppLang.getLang(context: context).female,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      color: AppConstants.primaryTextColor,
                      fontSize: AppConstants.size9.sp,
                    ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
