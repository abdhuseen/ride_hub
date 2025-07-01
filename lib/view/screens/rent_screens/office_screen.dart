import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/app_widgets/picture_box.dart';
import 'package:ride_hub/virual_data/data.dart';

import '../../../constants/app_constants.dart';
import '../../app_widgets/buttons/my_back_button.dart';
import '../../app_widgets/cards/car_card.dart';

class OfficeScreen extends StatelessWidget {
  Office office;
  OfficeScreen({super.key, required this.office});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(
            height: 67.h,
            child: MyBackButton(isFilled: true),
          ),
        ),
        centerTitle: true,
        title: Text(
          office.name,
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.size5.sp,
            height: 1,
            color: AppConstants.primaryTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Office image and description
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 180.h,
                      child: Image.asset(
                        office.imgLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        office.description,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: AppConstants.size8.sp,
                          height: 1.4,
                          color: AppConstants.primaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Rate, reviews, location
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: AppConstants.starColor),
                        SizedBox(width: 9.w),
                        Text(
                          office.rate.toString(),
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: AppConstants.size8.sp,
                            color: AppConstants.primaryTextColor,
                          ),
                        ),
                        SizedBox(width: 9.w),
                        Text(
                          "(${office.reviews} ${AppLang.getLang(context: context).reviews})",
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: AppConstants.size9.sp,
                            height: 1,
                            color: AppConstants.secondaryTextColor2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      office.location,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w400,
                        fontSize: AppConstants.size9.sp,
                        height: 1,
                        color: AppConstants.secondaryTextColor2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),

              // Reservations, phone number
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: AppConstants.starColor),
                        SizedBox(width: 9.w),
                        Text(
                          "${office.numberOfReservations} ${AppLang.getLang(context: context).reservations}",
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: AppConstants.size9.sp,
                            height: 1,
                            color: AppConstants.secondaryTextColor2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      office.phoneNumber,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w400,
                        fontSize: AppConstants.size9.sp,
                        height: 1,
                        color: AppConstants.secondaryTextColor2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Our Cars header
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  AppLang.getLang(context: context).our_cars,
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w700,
                    fontSize: AppConstants.size5.sp,
                    height: 1,
                    color: AppConstants.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(height: 6.h),

              // Cars horizontal list
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 16.w, right: index == cars.length - 1 ? 16.w : 0),
                      child: CarCard(
                        car: cars[index],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
