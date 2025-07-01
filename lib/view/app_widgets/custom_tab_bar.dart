import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/controller/widgets_controller/custom_tab_bar_controller.dart';

import '../../constants/app_constants.dart';

class CustomTabBar extends StatelessWidget {
  int numberOfTabs;
  List<String>tabsTitles;
   CustomTabBar({super.key,required this.numberOfTabs,required this.tabsTitles});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTabBarController>(builder:(context,customTabBarController, child) {
      return Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          SizedBox(width:20.w,),
          InkWell(
            onTap:(){
              customTabBarController.setSelectedIndex(0);
            },
            child:_buildTab(tabsTitles[0],customTabBarController.selectedIndex==0?onSelected():onUnSelected()),
          ),
          SizedBox(width:7.w,),
          InkWell(
            onTap:(){
              customTabBarController.setSelectedIndex(1);
            },
            child:_buildTab(tabsTitles[1],customTabBarController.selectedIndex==1?onSelected():onUnSelected()),
          ),
          SizedBox(width:7.w,),
          InkWell(
            onTap:(){
              customTabBarController.setSelectedIndex(2);
            },
            child:_buildTab(tabsTitles[2],customTabBarController.selectedIndex==2?onSelected():onUnSelected()),
          ),
          SizedBox(width:7.w,),
          InkWell(
            onTap:(){
              customTabBarController.setSelectedIndex(3);
            },
            child:_buildTab(tabsTitles[3],customTabBarController.selectedIndex==3?onSelected():onUnSelected()),
          ),



        ],
      );

    },);
  }
  Widget _buildTab(String title,Decoration decoration) {
    return Container(
      constraints: BoxConstraints(minWidth: 81.w),
      padding: EdgeInsets.fromLTRB(14.w, 5.h, 18.w, 5.h),
      alignment: Alignment.center,
      decoration:decoration,
      child:Text(title,
        style:GoogleFonts.mulish(
          fontSize:AppConstants.size8.sp,
          fontWeight: FontWeight.w400,
          color: AppConstants.secondaryTextColor1,
        ),
      ),
    );
  }
  Decoration onSelected(){
    return BoxDecoration(
      color: const Color(0xFFEAECF0),
      borderRadius: BorderRadius.circular(36.r),
      border: Border.all(color: const Color(0xFFEAECF0), width: 1),
    );
  }
  Decoration onUnSelected(){
    return BoxDecoration(
      color:AppConstants.secondaryColor,
      borderRadius: BorderRadius.circular(36.r),
      border: Border.all(color:AppConstants.primaryColor, width: 1),
    );
  }
}
