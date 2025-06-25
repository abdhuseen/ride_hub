import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/reviews_model.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

class ReviewRentalScreen extends StatelessWidget {
  String imageURL;
  String model;
  double rentalCost;

  ReviewRentalScreen({
    super.key,
    required this.model,
    required this.imageURL,
    required this.rentalCost,
  });

  List<ReviewsModel> review = [
    ReviewsModel(
      name: 'User 1',
      review:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s',
      date: '25/5/2025',
      starNumber: 3,
    ),
    ReviewsModel(
      name: 'User 2',
      review:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s',
      date: '25/6/2025',
      starNumber: 5,
    ),
  ];

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
                  // Review box
                  SizedBox(
                    width: 480.w,
                    height: 700.h,

                    child: ListView.builder(
                      itemCount: review.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(100, 217, 217, 217),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Stars
                                SizedBox(
                                  width: 150.w,
                                  height: 50.h,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Icon(Icons.star_border);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: review[index].starNumber,
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Review
                                BaseText(
                                  text: review[index].review,
                                  fontSize: AppConstants.size6.sp,
                                  FontFamily: '',
                                  textColor: AppConstants.primaryTextColor,
                                ),
                                SizedBox(height: 20),
                                // Reviewer name
                                BaseText(
                                  text: review[index].name,
                                  fontSize: AppConstants.size6.sp,
                                  FontFamily: '',
                                  textColor: Color.fromARGB(150, 117, 117, 117),
                                ),
                                SizedBox(height: 5),
                                // Date
                                BaseText(
                                  text: review[index].date,
                                  fontSize: AppConstants.size6.sp,
                                  FontFamily: '',
                                  textColor: Color.fromARGB(120, 117, 117, 117),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Book Now button
          Container(
            margin: EdgeInsets.only(top: 690.h, left: 30, right: 30),
            child: PrimaryButton(
              text: AppLang.getLang(context: context).book_now,
              onClick: () {},
            ),
          ),
        ],
      ),
    );
  }
}
