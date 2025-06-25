import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/reservation_screen.dart';

import '../login_screen.dart';

class GeneralInfoRental extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;
  String generalInfo;
  double mileage;
  int seatCapacity;
  String color;
  String carNumber;

  GeneralInfoRental({
    super.key,
    required this.imageURL,
    required this.generalInfo,
    required this.model,
    required this.rentalCost,
    required this.mileage,
    required this.seatCapacity,
    required this.color,
    required this.carNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image & general info
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Center(
                    child: Image.asset(imageURL, width: 220.w, height: 107.h),
                  ),
                  // Model & Rental cost
                  Container(
                    width: 380.w,
                    height: 70.h,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 245, 246, 248),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Model
                        BaseText(
                          text: model,
                          fontSize: AppConstants.size5.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        // Rental cost
                        BaseText(
                          text: '$rentalCost ${AppLang.getLang(context: context).jd_day}',
                          fontSize: AppConstants.size8.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.backgroundColor2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // Mileage & Seat Capacity
                  Container(
                    width: 380.w,
                    height: 160.h,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(20, 53, 51, 146),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mileage
                        Row(
                          children: [
                            BaseText(
                              text: '* ${AppLang.getLang(context: context).mileage}:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $mileage ${AppLang.getLang(context: context).km_balance}',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        // Seat Capacity
                        Row(
                          children: [
                            BaseText(
                              text: '* ${AppLang.getLang(context: context).seat_capacity}:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $seatCapacity ${AppLang.getLang(context: context).seat}',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        // Color
                        Row(
                          children: [
                            BaseText(
                              text: '* ${AppLang.getLang(context: context).color}:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $color',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        // Car Number
                        Row(
                          children: [
                            BaseText(
                              text: '* ${AppLang.getLang(context: context).car_number}:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $carNumber',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // General Information title
                  BaseText(
                    text: AppLang.getLang(context: context).general_information,
                    fontSize: AppConstants.size5.sp,
                    FontFamily: 'Mulish-Bold',
                    textColor: AppConstants.primaryTextColor,
                  ),
                  SizedBox(height: 5.h),
                  // General Information
                  Container(
                    width: 380.w,
                    height: 250.h,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(20, 53, 51, 146),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: BaseText(
                      text: generalInfo,
                      fontSize: AppConstants.size6.sp,
                      FontFamily: 'Mulish-Bold',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Book Now button
          Container(
            margin: EdgeInsets.only(top: 680.h, left: 30, right: 30),
            child: PrimaryButton(
              text: AppLang.getLang(context: context).book_now,
              onClick: () {
                bool isLogged=false;
                if(isLogged){
                  Navigator.push(context,MaterialPageRoute(builder:(context) =>ReservationScreen(),));
                }

                else {
                  Navigator.push(context,MaterialPageRoute(builder:(context) =>LoginScreen()),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
