import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/controller/widgets_controller/brand_card_controller.dart';

import '../../../model/brand.dart';

class BrandCard extends StatelessWidget {
   Brand brand;
   int brandIndex;
   BrandCard({super.key,required this.brand,required this.brandIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandCardController>(builder:(context,brandCardController, child) {
      return InkWell(
        onTap:(){
          if(brandCardController.selectedBrand.contains(brandIndex)){
            //this brand selected and now after clicked must be unSelected
            brandCardController.unSelectBrand(brandIndex);
          }else{
            //this brand unSelected and now after clicked must be  selected
            brandCardController.selectBrand(brandIndex);
          }

        },
        child:Container(
          width:78.w,
          height:78.h,
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(16.r),
            border:Border.all(width:1,
                color:brandCardController.selectedBrand.contains(brandIndex)?AppConstants.backgroundColor9:AppConstants.primaryColor),
            color:brandCardController.selectedBrand.contains(brandIndex)?AppConstants.backgroundColor9:AppConstants.secondaryColor,

        ),
          child:Padding(padding:EdgeInsetsGeometry.fromLTRB(8.w,16.h,8.w,16.h),
          child:Image.asset(brand.imgLink,
          fit:BoxFit.fill,
            width:50.w,
            height:50.h,
          ),

          ),


        ),
      );
    },);
  }
}
