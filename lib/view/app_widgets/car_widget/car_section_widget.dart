import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../constants/app_constants.dart';
import '../../../constants/app_lang.dart';
import '../../../controller/car_controller.dart';

import '../../../model/cars_model.dart';
import '../../screens/car_details_view.dart';
import '../buttons/txt_button.dart';
import 'car_item_widget.dart';
import 'package:provider/provider.dart';

class CarSectionWidget extends StatelessWidget {
  final CarSection section;

  const CarSectionWidget({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> translatedTitles = {
      'Luxury cars': AppLang.getLang(context: context).luxury_cars,
      'Buses and public transportation': AppLang.getLang(context: context).buses_and_public_transportation,
      'Electric cars': AppLang.getLang(context: context).electric_cars,
      'Economical Cars': AppLang.getLang(context: context).economic_cars,
    };

    return Consumer<CarController>(
      builder: (context, controller, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translatedTitles[section.title] ?? section.title,
                      style: GoogleFonts.mulish(
                        fontSize: AppConstants.size6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TxtButton(
                      text: AppLang.getLang(context: context).see_all,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailsView(
                              sectionTitle: section.title,
                            ),
                          ),
                        );
                      },
                      textStyle: TextStyle(
                        fontSize: AppConstants.size9,
                        color: AppConstants.primaryTextColor,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 122.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                  itemCount: section.cars.length,
                  itemBuilder: (context, index) {
                    final car = section.cars[index];
                    return Container(
                      width: 99.w,
                      margin: const EdgeInsets.only(right: 12),
                      child: CarItemWidget(
                        car: car,
                        isSelected: controller.isCarSelected(car.id),
                        onTap: () => controller.selectCar(car.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
