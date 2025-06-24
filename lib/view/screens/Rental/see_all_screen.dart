import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';
import 'package:ride_hub/view/screens/Rental/office_screen.dart';

class SeeAllScreen extends StatelessWidget {
  String title;
  List<dynamic> officeList;

  SeeAllScreen({super.key, required this.title, required this.officeList});

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
          GridView.builder(
            itemCount: officeList.length,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: const EdgeInsets.all(15),
                width: 180.w,
                height: 147.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => OfficeScreen(
                              title: officeList[index].name,
                              imageLink: officeList[index].imgLink,
                              rate: double.parse(officeList[index].rate.toString()),
                              reservation: double.parse(officeList[index].numberOfReservations.toString()),
                            ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // office image
                      Image.asset(
                        officeList[index].imgLink,
                        width: 48.w,
                        height: 48.h,
                      ),
                      SizedBox(height: 20.h),
                      // office name
                      BaseText(
                        text: officeList[index].name,
                        fontSize: AppConstants.size8.sp,
                        FontFamily: 'Mulish-Regular',
                        textColor: AppConstants.primaryTextColor,
                      ),
                      SizedBox(height: 10.h),
                      // rate
                      BaseText(
                        text: officeList[index].rate.toString(),
                        fontSize: AppConstants.size8.sp,
                        FontFamily: 'Mulish-Bold',
                        textColor: AppConstants.primaryColor,
                      ),
                      SizedBox(height: 5.h),
                      // reservation namber
                      BaseText(
                        text: officeList[index].numberOfReservations.toString(),
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
        ],
      ),
    );
  }
}
