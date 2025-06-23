import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

class ReviewRentalScreen extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;
  ReviewRentalScreen({super.key,required this.model,required this.imageURL,required this.rentalCost,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              SizedBox(height: 25.h),
              SizedBox(
                  width: 480.w,
                  height: 700.h,

                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context,index){
                        return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(100, 217, 217, 217),
                                width: 1,
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star_border,size: 20.sp,),
                                      SizedBox(width: 5),
                                      Icon(Icons.star_border,size: 20.sp,),
                                      SizedBox(width: 5),
                                      Icon(Icons.star_border,size: 20.sp,),
                                      SizedBox(width: 5),
                                      Icon(Icons.star_border,size: 20.sp,),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  BaseText(text: 'Lorem ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.', fontSize: AppConstants.size6.sp, FontFamily: '', textColor: AppConstants.primaryTextColor),
                                  SizedBox(height: 20),
                                  BaseText(text: 'Reviewer Name', fontSize: AppConstants.size6.sp, FontFamily: '', textColor: Color.fromARGB(150, 117, 117, 117)),
                                  SizedBox(height: 5),
                                  BaseText(text: 'Date', fontSize: AppConstants.size6.sp, FontFamily: '', textColor: Color.fromARGB(120, 117, 117, 117)),

                                ],
                              ),
                            ));
                      })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
