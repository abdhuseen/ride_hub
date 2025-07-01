import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/cards/category_card.dart';
import 'package:ride_hub/view/screens/rent_screens/previous_reservations_screen.dart';
import 'package:ride_hub/virual_data/data.dart';

class RentalHomeScreen extends StatelessWidget {
  const RentalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title:Center(
          child:Text(
             'RideHub',
             style:GoogleFonts.mulish(
               fontWeight:FontWeight.bold,
               fontSize: AppConstants.size2.sp,
               color: AppConstants.secondaryColor,
             ),
          ),
        ),
      ),
      body:SafeArea(
        child: Column(
          children: [
            //previous reservations button
            Padding(
              padding:EdgeInsets.only(left: 61.w, top: 21.h,right:67.w),
              child: PrimaryButton(
                text: AppLang.getLang(context: context).previous_rental_requests,
                onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>PreviousReservationsScreen(cars: cars)),
                    );

                },
              ),
            ),
            SizedBox(height: 26.h),
            //list of categories with list of offices followed the category
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categories: categories,
                    offices: [economicOffices, electricOffices, luxuryOffices, busesOffices],
                    index:index,
                  );
                },
              ),
            ),
          ],
        ),
      )


    );
  }
}
