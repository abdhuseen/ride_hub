import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/screens/rent_screens/office_screen.dart';

import '../../../constants/app_constants.dart';
import '../circle_image.dart';

class BaseOfficeCard extends StatelessWidget {
  Office office;
  BaseOfficeCard({super.key,required this.office});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //office image
        GestureDetector(
          child:CircleImage(imgLink:office.imgLink),
          onTap:(){
            //show all office details
            Navigator.push(context,MaterialPageRoute(builder:(context) =>OfficeScreen(office: office),));
          },
        ),
        SizedBox(height:12.h,),
        //office name
        Text(office.name,
        style:GoogleFonts.mulish(
            fontWeight:FontWeight.w400,
            fontSize:AppConstants.size8.sp,
            height:1,
            color:AppConstants.primaryTextColor
        ),
        ),
        SizedBox(width:11.w,),
      ],
    );
  }
}
