import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/car.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/model/request_model.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/Rental/rental_car.dart';

class PreviousRentalRequests extends StatelessWidget {
   PreviousRentalRequests({super.key});

  List<RequestModel> previousRequests = [
    RequestModel(imageURL: 'assets/testImages/car1.png', name: 'Maserati', rentalPrice: 85.0, year: 2020, state: 'Reject'),
    RequestModel(imageURL: 'assets/testImages/car2.png', name: 'Maserati', rentalPrice: 65.0, year: 2025, state: 'Accept')

  ];



   // Car(
   // name: 'Maserati',
   // imagesLinks: ['assets/testImages/car1.png','assets/testImages/carDet.png','assets/testImages/carDet2.png'],
   // model: 'Toyota',
   // year: 2020,
   // rentCost: 85,
   // engineCapacity: 2.5,
   // engineType: '4-cylinder (203–206 hp)',
   // fuel: ' ~29–41 mpg (city/highway)',
   // hoursPower: 225,
   // seatCapacity: 4,
   // mileage: 3000,
   // generalInfo: 'Lorem ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
   // reviews: 3,
   // rate: 4,
   // price: 0,
   // dateOfAdd: '23/6/2025',
   // ),
   // Car(
   // name: 'Maserati',
   // imagesLinks: ['assets/testImages/car2.png','assets/testImages/carDet.png','assets/testImages/carDet2.png'],
   // model: 'Toyota2',
   // year: 2024,
   // rentCost: 85,
   // engineCapacity: 2.5,
   // engineType: '4-cylinder (203–206 hp)',
   // fuel: ' ~29–41 mpg (city/highway)',
   // hoursPower: 225,
   // seatCapacity: 4,
   // mileage: 3000,generalInfo: 'Lorem ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
   // reviews: 3,
   // rate: 4,
   // price: 0,
   // dateOfAdd: '23/6/2025',
   // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BaseText(
          text: AppLang.getLang(context: context).previous_rental_requests,
          fontSize: AppConstants.size5.sp,
          FontFamily: 'Mulish-Bold',
          textColor: AppConstants.primaryTextColor,
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SingleChildScrollView(
            child: SizedBox(
              width: 428.w,
              height: 500.h,
              child: GridView.builder(
                itemCount: previousRequests.length,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    width: 170.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 5),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder:
                        //         (context) =>RentalCar(
                        //           carName: previousRequests[index].name,
                        //           imageURL:
                        //           previousRequests[index].imageURL,
                        //           generalInfo:
                        //           previousRequests[index].generalInfo,
                        //           model: previousRequests[index].model,
                        //           rentalCost:
                        //           previousRequests[index].rentCost,
                        //           imagesLinks: previousRequests[index].imagesLinks,  engineType: previousRequests[index].engineType, hoursPower: previousRequests[index].hoursPower, fuel: previousRequests[index].fuel, mileage: previousRequests[index].mileage, seatCapacity: previousRequests[index].seatCapacity, engineCapacity: previousRequests[index].engineCapacity,
                        //         ),
                        //   ),
                        // );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            previousRequests[index].imageURL,
                            width: 161.w,
                            height: 52.h,
                          ),
                          SizedBox(height: 2.h),
                          BaseText(
                            text: previousRequests[index].name,
                            fontSize: AppConstants.size8.sp,
                            FontFamily: 'Mulish-Regular',
                            textColor: AppConstants.primaryTextColor,
                          ),
                          SizedBox(height: 2.h),
                          BaseText(
                            text: previousRequests[index].year.toString(),
                            fontSize: AppConstants.size8.sp,
                            FontFamily: 'Mulish-Bold',
                            textColor: AppConstants.primaryColor,
                          ),
                          SizedBox(height: 2.h),
                          BaseText(
                            text:
                            '${previousRequests[index].rentalPrice.toString()} ${AppLang.getLang(context: context).jd_day}',
                            fontSize: AppConstants.size8.sp,
                            FontFamily: 'Mulish-Bold',
                            textColor: AppConstants.primaryColor,
                          ),

                          BaseText(
                            text:
                           previousRequests[index].state,
                            fontSize: AppConstants.size4.sp,
                            FontFamily: 'Mulish-Bold',
                            textColor: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
