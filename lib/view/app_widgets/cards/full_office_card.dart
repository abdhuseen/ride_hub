import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/app_widgets/circle_image.dart';

import '../../screens/rent_screens/office_screen.dart';

class FullOfficeCard extends StatelessWidget {
  Office office;
  FullOfficeCard({super.key, required this.office});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
       //office details
        Navigator.push(context,MaterialPageRoute(builder:(context) =>OfficeScreen(office: office),));
      },
      child:Container(
        padding: EdgeInsets.fromLTRB(17.w, 8.h, 18.w, 8.h),
        decoration: BoxDecoration(
          color: AppConstants.secondaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // for better vertical alignment in grid
          children: [
            SizedBox(height: 10.h),
            // office image
            CircleImage(imgLink:office.imgLink),
            SizedBox(height: 10.h),
            // office name
            Text(
              office.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.size8.sp,
                height: 1,
                color: AppConstants.primaryTextColor,
              ),
            ),
            SizedBox(height: 10.h),
            // office rating
            Text(
              office.rate.toString(),
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.size9.sp,
                height: 1,
                color: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            // office reservations
            Text(
              "${office.numberOfReservations} ${AppLang.getLang(context: context).reservations}",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.size9.sp,
                height: 1,
                color: AppConstants.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
