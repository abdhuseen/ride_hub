import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/Rental/capabilities_rental.dart';
import 'package:ride_hub/view/screens/Rental/general_info_rental.dart';
import 'package:ride_hub/view/screens/Rental/rental_images_screen.dart';
import 'package:ride_hub/view/screens/Rental/review_rental_screen.dart';

class RentalCar extends StatelessWidget {
  String carName;
  String imageURL;
  String model;
  double rentalCost;
  String generalInfo;
  String capabilities;
  List<String> imagesLinks;

  RentalCar({super.key, required this.carName,required this.imageURL,required this.generalInfo,required this.model,required this.rentalCost,required this.capabilities,required this.imagesLinks});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: carName,
                fontSize: AppConstants.size5.sp,
                FontFamily: 'Mulish-Bold',
                textColor: AppConstants.primaryTextColor,
              ),
              Icon(Icons.home),
            ],
          ),
          bottom: TabBar(
           indicatorColor: Colors.white,
            dividerColor: Colors.white,
unselectedLabelColor: Colors.red,

            tabs: [
              Tab(
                child: Container(
                  width: 87.w,
                  height: 36.h,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppConstants.primaryColor),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).general,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 105.w,
                  height: 36.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppConstants.primaryColor),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).capabilities,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 87.w,
                  height: 36.h,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppConstants.primaryColor),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).images,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 87.w,
                  height: 36.h,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppConstants.primaryColor),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).reviews,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GeneralInfoRental(imageURL: imageURL,generalInfo: generalInfo, model: model, rentalCost: rentalCost,),
            CapabilitiesRental(imageURL: imageURL, rentalCost: rentalCost, model: model, capabilities: capabilities),
           RentalImagesScreen(model: model, imagesLinks: imagesLinks, rentalCost: rentalCost, imageURL: imageURL),
           ReviewRentalScreen(model: model, imageURL: imageURL, rentalCost: rentalCost),
          ],
        ),
      ),
    );
  }
}
