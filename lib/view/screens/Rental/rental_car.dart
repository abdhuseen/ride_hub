import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/view/app_widgets/buttons/home_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/Rental/capabilities_rental.dart';
import 'package:ride_hub/view/screens/Rental/general_info_rental.dart';
import 'package:ride_hub/view/screens/Rental/rental_home.dart';
import 'package:ride_hub/view/screens/Rental/rental_images_screen.dart';
import 'package:ride_hub/view/screens/Rental/review_rental_screen.dart';

class RentalCar extends StatelessWidget {
  String carName;
  String imageURL;
  String model;
  double rentalCost;
  String generalInfo;

  // capabilities
  String engineType;
  double engineCapacity;
  int hoursPower;
  String fuel;
  double performanceScore;
  String transmissionType;

  //general
  int seatCapacity;
  double mileage;
  List<String> imagesLinks;
  String carNumber;
  String color;

  RentalCar({
    super.key,
    required this.carName,
    required this.imageURL,
    required this.generalInfo,
    required this.model,
    required this.rentalCost,
    required this.engineCapacity,
    required this.engineType,
    required this.hoursPower,
    required this.fuel,
    required this.mileage,
    required this.seatCapacity,
    required this.imagesLinks,
    required this.carNumber,
    required this.color,
    required this.transmissionType,
    required this.performanceScore,
  });

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
              HomeButton(homePage: RentalHome()),
            ],
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),

            dividerColor: Colors.white,
            labelColor: AppConstants.primaryTextColor,
            labelPadding: EdgeInsetsGeometry.all(0.5),
            tabs: [
              Tab(
                child: Container(
                  width: 87.w,
                  height: 70.h,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).general,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 105.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).capabilities,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 87.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).images,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 87.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: BaseText(
                      text: AppLang.getLang(context: context).reviews,
                      fontSize: AppConstants.size8.sp,
                      FontFamily: '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GeneralInfoRental(
              imageURL: imageURL,
              generalInfo: generalInfo,
              model: model,
              rentalCost: rentalCost,
              mileage: mileage,
              seatCapacity: seatCapacity,
              color: color,
              carNumber: carNumber,
            ),
            CapabilitiesRental(
              imageURL: imageURL,
              rentalCost: rentalCost,
              model: model,
              fuel: fuel,
              hoursPower: hoursPower,
              engineType: engineType,
              engineCapacity: engineCapacity,
              performanceScore: performanceScore,
              transmissionType: transmissionType,
            ),
            RentalImagesScreen(
              model: model,
              imagesLinks: imagesLinks,
              rentalCost: rentalCost,
              imageURL: imageURL,
            ),
            ReviewRentalScreen(
              model: model,
              imageURL: imageURL,
              rentalCost: rentalCost,
            ),
          ],
        ),
      ),
    );
  }
}
