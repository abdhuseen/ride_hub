import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

import '../login_screen.dart';
import '../reservation_screen.dart';

class CapabilitiesRental extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;

  // capabilities
  String engineType;
  double engineCapacity;
  int hoursPower;
  String fuel;
  String transmissionType;
  double performanceScore;

  CapabilitiesRental({
    super.key,
    required this.imageURL,
    required this.rentalCost,
    required this.model,
    required this.fuel,
    required this.hoursPower,
    required this.engineType,
    required this.engineCapacity,
    required this.performanceScore,
    required this.transmissionType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // image & capabilities
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
                  // Car Image
                  Center(
                    child: Image.asset(imageURL, width: 220.w, height: 107.h),
                  ),
                  // Model & rental cost
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
                        // Rental Cost
                        BaseText(
                          text: '$rentalCost ${AppLang.getLang(context: context).jd_day}',
                          fontSize: AppConstants.size8.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.backgroundColor2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  // Capabilities
                  Container(
                    width: 380.w,
                    height: 400.h,
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
                        // Engine Option
                        BaseText(
                          text: '* ${AppLang.getLang(context: context).engine_option}:',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '  $engineCapacity ${AppLang.getLang(context: context).l}\n  $engineType',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        SizedBox(height: 15.h),
                        // Hours Power
                        BaseText(
                          text: '* ${AppLang.getLang(context: context).hoers_power}:',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '  $hoursPower hp',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        SizedBox(height: 15.h),
                        // Transmission Type
                        BaseText(
                          text: '* ${AppLang.getLang(context: context).transmission_type}:',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '  $transmissionType',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        SizedBox(height: 15.h),
                        // Fuel type
                        BaseText(
                          text: '* ${AppLang.getLang(context: context).fuel_type}:',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '  $fuel',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        SizedBox(height: 15.h),
                        // Performance score
                        BaseText(
                          text: '* ${AppLang.getLang(context: context).performance_score}:',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '  $performanceScore',
                          fontSize: AppConstants.size6.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Book Now Button
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
