import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/login_screen.dart';

import '../reservation_screen.dart';

class RentalImagesScreen extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;
  List<String> imagesLinks;

  RentalImagesScreen({
    super.key,
    required this.model,
    required this.imagesLinks,
    required this.rentalCost,
    required this.imageURL,
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
                  // Main car image
                  Center(
                    child: Image.asset(imageURL, width: 220.w, height: 107.h),
                  ),
                  // Car Model & rental cost
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
                          text: '$rentalCost ${AppLang.getLang(context: context).jd_day}',
                          fontSize: AppConstants.size8.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.backgroundColor2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  // Car Images
                  SizedBox(
                    width: 480.w,
                    height: 700.h,

                    child: ListView.builder(
                      itemCount: imagesLinks.length - 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Image.asset(imagesLinks[index + 1]),
                        );
                      },
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
