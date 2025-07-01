import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../model/car.dart';
import '../../screens/shared_screens/car_details_screen.dart';

class CarCard extends StatelessWidget {
  Car car;
   CarCard({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        //car  details
        Navigator.push(context,MaterialPageRoute(builder:(context) =>CarDetailsScreen(car: car),));
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
            // car image
            SizedBox(
            width: 161.w,
            height: 82.h,
            child: Image.asset(
              car.imagesLinks[0],
              fit: BoxFit.cover,
            ),
          ),
            SizedBox(height: 10.h),
            // car brand
            Text(
              car.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.size8.sp,
                height: 1,
                color: AppConstants.primaryTextColor,
              ),
            ),
            SizedBox(height: 10.h),
            // car year
            Text(
              car.year.toString(),
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.size9.sp,
                height: 1,
                color: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            // car rent cost
            Text(
              "${car.rentCost} ${AppLang.getLang(context: context).jd_day}",
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
