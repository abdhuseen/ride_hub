import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/widgets_controller/brand_card_controller.dart';
import 'package:ride_hub/controller/widgets_controller/drop_down_menu_button_controller.dart';
import 'package:ride_hub/controller/widgets_controller/range_slider_controller.dart';
import 'package:ride_hub/view/app_widgets/buttons/drop_down_menu_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/txt_button.dart';
import 'package:ride_hub/view/app_widgets/min_max_slider.dart';
import 'package:ride_hub/virual_data/data.dart';

import '../../app_widgets/cards/brand_card.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        toolbarHeight:80.h,
        title:Text(
          AppLang.getLang(context: context).filter_by,
          style:GoogleFonts.mulish(
              fontWeight:FontWeight.w700,
              fontSize:AppConstants.size5.sp,
              height:1,
              color:AppConstants.primaryTextColor2

          ),
        ),
        actions: [
          SizedBox(width:200.w,),
          TxtButton(text:"${AppLang.getLang(context: context).clear_all} x",
              onClick:(){
                DropDownMenuButtonController dropDownMenuButtonController=Provider.of(context,listen:false);
                dropDownMenuButtonController.reset();
                BrandCardController brandCardController=Provider.of(context,listen:false);
                brandCardController.reset();
                RangeSliderController rangeSliderController=Provider.of(context,listen:false);
                rangeSliderController.reset();

              }, textStyle:GoogleFonts.roboto(
                  fontWeight:FontWeight.w400,
                  fontSize:AppConstants.size9.sp,
                  height:1,
                  color:AppConstants.primaryTextColor

              ))
        ],

      ),
      body:Column(
        children: [
          //brand label
          Padding(padding:EdgeInsetsGeometry.only(left:25.w,right:(MediaQuery.of(context).size.width-50).w,top:20),
          child:Text(AppLang.getLang(context: context).brand,
          style:GoogleFonts.mulish(
            fontWeight:FontWeight.w700,
            fontSize:AppConstants.size6.sp,
            height:1.36125,
            color:AppConstants.secondaryTextColor11
          ),
          ),
          ),
          //brand horizontal list
          Padding(padding:EdgeInsetsGeometry.only(top:16.h),
          child:SizedBox(
            height:180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left:16.w), // optional padding
              itemCount:brands.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding:EdgeInsets.only(right: 12.w),
                  child:BrandCard(brand:brands[i],brandIndex:i,),
                );
              },
            ),
          ),
          ),
          //added date label
          Padding(padding:EdgeInsets.only(left:25.w,right:(MediaQuery.of(context).size.width-100).w,top:23.h),
          child:Text(AppLang.getLang(context: context).added_day,
          style:GoogleFonts.mulish(
            fontWeight:FontWeight.w700,
            fontSize:AppConstants.size6.sp,
            height: 1.36125,
            color:AppConstants.secondaryTextColor11

          ),
          ),

          ),
          //drop down menus for months and years
          Padding(padding:EdgeInsets.only(left:24.w,right:24.w,top:6.h),
            child:DropDownMenuButton(),

          ),
          //pricing range label
          Padding(padding:EdgeInsets.only(left:25.w,right:(MediaQuery.of(context).size.width-100).w,top:23.h),
            child:Text(AppLang.getLang(context: context).price_range,
              style:GoogleFonts.mulish(
                  fontWeight:FontWeight.w700,
                  fontSize:AppConstants.size6.sp,
                  height: 1.36125,
                  color:AppConstants.secondaryTextColor11

              ),
            ),

          ),
          MinMaxSlider(),
          //pricing range label
          Padding(padding:EdgeInsets.only(left:25.w,right:(MediaQuery.of(context).size.width-100).w,top:23.h),
            child:Text(AppLang.getLang(context: context).rate_range,
              style:GoogleFonts.mulish(
                  fontWeight:FontWeight.w700,
                  fontSize:AppConstants.size6.sp,
                  height: 1.36125,
                  color:AppConstants.secondaryTextColor11

              ),
            ),

          ),
          MinMaxSlider(isForPrice:false,),
          Padding(padding:EdgeInsetsGeometry.only(left:24.w,right:24.w,top:32.h),
          child:PrimaryButton(text:AppLang.getLang(context: context).show_result,
          onClick:(){
            //get filter data from controllers then send it to server
          },
          ),
          )

        ],
      ),

    );
  }
}
