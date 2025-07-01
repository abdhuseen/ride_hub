import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_constants.dart';
import '../../../model/car.dart';
import '../../screens/shared_screens/car_details_screen.dart';


class CarForBuyCard extends StatelessWidget {
  Car  car;
   CarForBuyCard({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        //car  details
        Navigator.push(context,MaterialPageRoute(builder:(context) =>CarDetailsScreen(car: car),));
      },
      child:Container(
        padding: EdgeInsets.fromLTRB(17.w, 8.h, 18.w, 8.h),
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
            SizedBox(height:12.h),
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
            //num of cars of this brand
            SizedBox(height:12.h),
            // car rent cost
            Text(
              "+${Random().nextInt(41)}",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
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
