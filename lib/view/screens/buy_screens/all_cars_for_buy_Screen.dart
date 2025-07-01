import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/model/car_category.dart';
import 'package:ride_hub/view/app_widgets/cards/car_details_for_buy_card.dart';
import 'package:ride_hub/view/screens/buy_screens/filter_screen.dart';

import '../../../constants/app_constants.dart';
import '../../../model/car.dart';
import '../../app_widgets/buttons/my_back_button.dart';
import '../../app_widgets/cards/car_card.dart';

class AllCarsForBuyScreen extends StatelessWidget {
  CarCategory category;
  List<Car>cars;
   AllCarsForBuyScreen({super.key,required this.category,required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(
            height: 67.h,
            child: MyBackButton(isFilled:false,),
          ),
        ),
        centerTitle: true,
        title:Row(
          children: [
            Spacer(),
            Text(
              category.name,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.size5.sp,
                height: 1,
                color: AppConstants.primaryTextColor,
              ),
            ),
            Spacer(),
            //filter button
            IconButton(onPressed:(){

              Navigator.push(context,MaterialPageRoute(builder:(context) =>FilterScreen(),));

            }, icon:Image.asset("assets/icons/filter_icon.png",
            fit:BoxFit.cover,
             width:35.w,
             height:35.h,
            ),
            )
          ],
        ),
      ),
      body: SafeArea(
        // Cars vertical list
        child: SizedBox(
                height:double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 16.w, right:16.w ,bottom:16.h),
                      child: CarDetailsForBuyCard(
                        car: cars[index],
                      ),
                    );
                  },
                ),
              ),




      ),
    );
  }
}
