import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../constants/app_constants.dart';
import '../../../model/car.dart';
import '../../../model/cars_model.dart';




class CarItemWidget extends StatelessWidget {
  final Car car;
  final bool isSelected;
  final VoidCallback? onTap;

  const CarItemWidget({
    Key? key,
    required this.car,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84.w,
        height: 122.h,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: AppConstants.primaryColor, width: 2)
              : Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(8),
          color:AppConstants.secondaryColor,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                car.imagePath,
                fit: BoxFit.contain,

              ),
            ),
           SizedBox(height: 4.h),
            Text(
              car.brand,
              style: TextStyle(
                fontSize: AppConstants.size8,
              ),
            ),
            Text(
              '+${car.count}',
              style: TextStyle(
                fontSize: AppConstants.size9,
                color: AppConstants.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
