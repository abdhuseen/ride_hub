import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

class GeneralInfoRental extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;
  String generalInfo;
  double mileage;
  int seatCapacity;

  GeneralInfoRental({
    super.key,
    required this.imageURL,
    required this.generalInfo,
    required this.model,
    required this.rentalCost,
    required this.mileage,
    required this.seatCapacity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
                  Center(child: Image.asset(imageURL, width: 220.w, height: 107.h)),
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
                        BaseText(
                          text: model,
                          fontSize: AppConstants.size5.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                        BaseText(
                          text: '$rentalCost JD/day',
                          fontSize: AppConstants.size8.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.backgroundColor2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: 380.w,
                    height: 100.h,
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
                        Row(
                          children: [
                            BaseText(
                              text: '* Mileage:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $mileage km balance',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            BaseText(
                              text: '* Seat Capacity:',
                              fontSize: AppConstants.size6.sp,
                              FontFamily: 'Mulish-Bold',
                              textColor: AppConstants.primaryTextColor,
                            ),
                            BaseText(
                              text: '  $seatCapacity seat',
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
                  BaseText(
                    text: 'General Information',
                    fontSize: AppConstants.size5.sp,
                    FontFamily: 'Mulish-Bold',
                    textColor: AppConstants.primaryTextColor,
                  ),
                  SizedBox(height: 5.h),
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
          Container(
              margin: EdgeInsets.only(top: 680.h,left: 30,right: 30),
              child: PrimaryButton(text: AppLang.getLang(context: context).book_now, onClick: (){}))
        ],
      ),
    );
  }
}
