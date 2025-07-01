import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/view/app_widgets/cards/category_buy_section_card.dart';

import '../../../constants/app_constants.dart';
import '../../../virual_data/data.dart';
import '../../app_widgets/cards/category_card.dart';

class BuyHomeScreen extends StatelessWidget {
  const BuyHomeScreen({super.key});

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
              SizedBox(height:45.h),
              //list of categories with list of offices followed the category
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBuySectionCard(
                      categories: categories,
                      cars:cars,
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
