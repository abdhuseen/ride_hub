import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/car.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/Rental/rental_car.dart';

class OfficeScreen extends StatelessWidget {
  String title;
  String imageLink;
  double rate;
  double reservation;

  OfficeScreen({
    super.key,
    required this.title,
    required this.imageLink,
    required this.rate,
    required this.reservation,
  });

  List<Car> economicCars = [
    Car(
      name: 'Maserati',
      imagesLinks: ['assets/testImages/car1.png','assets/testImages/carDet.png','assets/testImages/carDet.png'],
      model: 'Toyota',
      year: 2020,
      rentCost: 85,
      capabilities: '* Engine Options:\n  2.5L 4-cylinder (203–206 hp)\n  3.5L V6 (301 hp) for higher trims\n* Fuel Efficiency:\n ~29–41 mpg (city/highway)\n* Drive Options:\n  Front-Wheel Drive (FWD)\n  All-Wheel Drive\n* Safety:\n  Toyota Safety Sense P (TSS-P): Pre-\n  collision, lane departure alert, adaptive\n  cruise control\n* Technology:\n  7–8 touchscreen, Apple CarPlay, \n  Android Auto, Wi-Fi hotspot',
      generalInfo: 'Lorem ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      reviews: 3,
      rate: 4,
      price: 0,
      dateOfAdd: '23/6/2025',
    ),
    Car(
      name: 'Maserati',
      imagesLinks: ['assets/testImages/car2.png'],
      model: 'Toyota2',
      year: 2024,
      rentCost: 85,
      capabilities: '* Engine Options:\n  2.5L 4-cylinder (203–206 hp)\n  3.5L V6 (301 hp) for higher trims\n* Fuel Efficiency:\n ~29–41 mpg (city/highway)\n* Drive Options:\n  Front-Wheel Drive (FWD)\n  All-Wheel Drive\n* Safety:\n  Toyota Safety Sense P (TSS-P): Pre-\n  collision, lane departure alert, adaptive\n  cruise control\n* Technology:\n  7–8 touchscreen, Apple CarPlay, \n  Android Auto, Wi-Fi hotspot',
      generalInfo: 'Lorem ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      reviews: 3,
      rate: 4,
      price: 0,
      dateOfAdd: '23/6/2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BaseText(
          text: title,
          fontSize: AppConstants.size5.sp,
          FontFamily: 'Mulish-Bold',
          textColor: AppConstants.primaryTextColor,
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(imageLink, width: 251.w, height: 212.h),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.w,
                          color: AppConstants.starColor,
                        ),
                        SizedBox(width: 10.w),
                        BaseText(
                          text: rate.toString(),
                          fontSize: AppConstants.size9.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.w,
                          color: AppConstants.starColor,
                        ),
                        SizedBox(width: 10.w),
                        BaseText(
                          text:
                              "${reservation.toString()}  ${AppLang.getLang(context: context).number_of_reservations} ",
                          fontSize: AppConstants.size9.sp,
                          FontFamily: 'Mulish-Bold',
                          textColor: AppConstants.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BaseText(
                      text: AppLang.getLang(context: context).our_cars,
                      fontSize: AppConstants.size5.sp,
                      FontFamily: 'Mulish-Bold',
                      textColor: AppConstants.primaryTextColor,
                    ),
                  ),

                  SizedBox(
                    width: 428.w,
                    height: 500.h,
                    child: GridView.builder(
                      itemCount: economicCars.length,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: const EdgeInsets.all(15),
                          width: 170.w,
                          height: 147.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => RentalCar(
                                        carName: economicCars[index].name,
                                        imageURL:
                                            economicCars[index].imagesLinks[0],
                                        generalInfo:
                                            economicCars[index].generalInfo,
                                        model: economicCars[index].model,
                                        rentalCost:
                                            economicCars[index].rentCost, capabilities: economicCars[index].capabilities,
                                        imagesLinks: economicCars[index].imagesLinks,
                                      ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  economicCars[index].imagesLinks[0],
                                  width: 161.w,
                                  height: 52.h,
                                ),
                                SizedBox(height: 20.h),
                                BaseText(
                                  text: economicCars[index].name,
                                  fontSize: AppConstants.size8.sp,
                                  FontFamily: 'Mulish-Regular',
                                  textColor: AppConstants.primaryTextColor,
                                ),
                                SizedBox(height: 10.h),
                                BaseText(
                                  text: economicCars[index].year.toString(),
                                  fontSize: AppConstants.size8.sp,
                                  FontFamily: 'Mulish-Bold',
                                  textColor: AppConstants.primaryColor,
                                ),
                                SizedBox(height: 5.h),
                                BaseText(
                                  text:
                                      '${economicCars[index].rentCost.toString()} ${AppLang.getLang(context: context).jd_day}',
                                  fontSize: AppConstants.size8.sp,
                                  FontFamily: 'Mulish-Bold',
                                  textColor: AppConstants.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
