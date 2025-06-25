import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';


import '../../constants/app_lang.dart';
import '../../controller/car_controller.dart';
import '../app_widgets/buttons/my_back_button.dart';
import 'car_details_page.dart';
import 'filter_view.dart';



class CarDetailsView extends StatelessWidget {
  final String sectionTitle;

  const CarDetailsView({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  String getTranslatedSectionTitle(BuildContext context, String title) {
    final translations = {
      'Luxury cars': AppLang.getLang(context: context).luxury_cars,
      'Buses and public transportation': AppLang.getLang(context: context).buses_and_public_transportation,
      'Electric cars': AppLang.getLang(context: context).electric_cars,
      'Economical Cars': AppLang.getLang(context: context).economic_cars,
    };

    return translations[title] ?? title;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppConstants.secondaryColor,
      appBar: AppBar(
        title: Text(
          getTranslatedSectionTitle(context, sectionTitle),
          style: GoogleFonts.mulish(
            color: AppConstants.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.size5,

          ),
        ),

        centerTitle: true,
        backgroundColor: AppConstants.secondaryColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left:15.w),
          child: MyBackButton(isFilled: false),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.tune, color:AppConstants.primaryTextColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  FilterView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CarController>(
        builder: (context, controller, child) {
          final carDetails = controller.getCarDetails(sectionTitle);

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: carDetails.length,
            itemBuilder: (context, index) {
              final car = carDetails[index];
              return GestureDetector(
                onTap: () {
                  final fullDetail = controller.getFullCarDetail(car.id);
                  if (fullDetail != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailPage(car: fullDetail),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: AppConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة السيارة
                        Container(
                          height: 156.h,
                          width: 380.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              car.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.directions_car,
                                  size: 50,
                                  color: Colors.grey.shade400,
                                );
                              },
                            ),
                          ),
                        ),
                         SizedBox(height: 12.h),

                        // معلومات السيارة
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // اسم السيارة

                            Text(
                              car.name,
                              style: GoogleFonts.macondo(
                                fontSize: AppConstants.size5,
                                color: AppConstants.primaryTextColor,
                              ),
                            ),
                             SizedBox(height: 4.h),

                            Text(
                              car.year.toString(),
                              style: TextStyle(
                                fontSize: AppConstants. size9,
                                color: AppConstants.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),

                        // السعر
                        Center(
                          child: Text(
                            car.price,
                            style:  TextStyle(
                              fontSize:AppConstants.size8,

                              color:  AppConstants.backgroundColor2,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
