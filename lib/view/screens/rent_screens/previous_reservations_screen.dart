import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/cards/rent_response_card.dart';

import '../../../constants/app_constants.dart';
import '../../../model/car.dart';
import '../../app_widgets/buttons/my_back_button.dart';

class PreviousReservationsScreen extends StatelessWidget {
  List<Car> cars;
   PreviousReservationsScreen({super.key,required this.cars});

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
          AppLang.getLang(context: context).previous_rental_requests,
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.size5.sp,
            height: 1,
            color: AppConstants.primaryTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,               // 2 items per row
            crossAxisSpacing: 12.w,          // horizontal space between items
            mainAxisSpacing: 16.h,           // vertical space between items
            childAspectRatio: 0.8,           // width/height ratio of each grid item
          ),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return RentResponseCard(car: cars[index]);
          },
        ),
      ),
    );
  }
}
