import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../model/car.dart';
import '../../screens/shared_screens/car_details_screen.dart';


class CarDetailsForBuyCard extends StatelessWidget {
  Car car;
  CarDetailsForBuyCard({super.key,required this.car});

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
          color: AppConstants.backgroundColor6,
          borderRadius: BorderRadius.circular(25.r),
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
            //model , year
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                //model
                Text(
                  car.model,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mako(
                    fontWeight: FontWeight.w700,
                    fontSize: AppConstants.size5.sp,
                    height: 1,
                    color: AppConstants.secondaryTextColor1,
                  ),
                ),
                // car year
                Text(
                  car.year.toString(),
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w400,
                    fontSize: AppConstants.size9.sp,
                    height: 1,
                    color: AppConstants.primaryTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // car price
            Text(
              "${car.price} ${AppLang.getLang(context: context).jd}",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.size8.sp,
                height: 1,
                color: AppConstants.backgroundColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
