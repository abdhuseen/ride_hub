import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/car_category.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/app_widgets/cards/base_office_card.dart';
import 'package:ride_hub/view/screens/rent_screens/offices_of_category_screen.dart';

class CategoryCard extends StatelessWidget {
  List<CarCategory> categories;
  List<List<Office>> offices;
  int index;

  CategoryCard({
    super.key,
    required this.categories,
    required this.offices,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // better alignment
      children: [
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
                //show all offices with full details
                Navigator.push(context,MaterialPageRoute(builder:(context) =>OfficesOfCategoryScreen(category:categories[index], offices:offices[index]),));
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
        //list of offices
        SizedBox(
          height: 140.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16.w), // optional padding
            itemCount: offices[index].length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: BaseOfficeCard(office: offices[index][i]),
              );
            },
          ),
        ),

      ],
    );
  }
}

