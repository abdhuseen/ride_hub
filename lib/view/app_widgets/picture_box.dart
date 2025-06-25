import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';


class PictureBox extends StatelessWidget {
  final String imagePath;
  final String initialImageAssetsPath;
  const PictureBox({
    super.key,
    required this.initialImageAssetsPath,
    this.imagePath = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width:300.w,
        decoration: BoxDecoration(
          color: AppConstants.secondaryColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: AppConstants.secondaryTextColor5),
        ),
        child:ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: imagePath.isNotEmpty
                  ? Image.file(
                File(imagePath),
                width: 300.w,
                height: 200.w,
                fit: BoxFit.cover,
              )
                  :Image.asset(
                initialImageAssetsPath,
                width: 300.w,
                height:200.w,
                fit: BoxFit.cover,
              ),
            ),


      );
  }
}
