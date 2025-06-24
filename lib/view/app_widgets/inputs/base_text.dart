import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';

class BaseText extends StatelessWidget {
  String text;
 var textColor;
  String FontFamily;
  double fontSize;

  BaseText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.FontFamily,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: FontFamily,
        fontSize: fontSize,
      ),
    );
  }
}
