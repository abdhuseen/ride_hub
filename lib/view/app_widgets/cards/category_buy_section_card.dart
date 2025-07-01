import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/view/app_widgets/cards/car_for_buy_card.dart';
import 'package:ride_hub/view/screens/buy_screens/all_cars_for_buy_Screen.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../model/car.dart';
import '../../../model/car_category.dart';
import '../buttons/txt_button.dart';

class CategoryBuySectionCard extends StatelessWidget {
  List<CarCategory> categories;
  List<Car>cars;
  int index;
  CategoryBuySectionCard({super.key,required this.categories,required this.cars,required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // better alignment
      children: [
        //category name with text button
        Padding(padding:EdgeInsets.only(left:24.w),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //category name
              Text(
                categories[index].name,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w700,
                  fontSize: AppConstants.size5.sp,
                  height: 1,
                  color: AppConstants.primaryTextColor,
                ),
              ),
              //see all button
              TxtButton(
                text: "${AppLang.getLang(context: context).see_all} >",
                onClick: () {
                  //show all cars of this category
                  Navigator.push(context,MaterialPageRoute(builder:(context) =>AllCarsForBuyScreen(category:categories[index], cars: cars),));
                },
                textStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: AppConstants.size9.sp,
                  height: 1,
                  color: AppConstants.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:6.h),
        //list of cars
        SizedBox(
          height:180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left:16.w), // optional padding
            itemCount:cars.length,
            itemBuilder: (context, i) {
              return Padding(
                padding:EdgeInsets.only(right: 12.w),
                child:CarForBuyCard(car:cars[i]),
              );
            },
          ),
        ),

      ],
    );
  }
}
