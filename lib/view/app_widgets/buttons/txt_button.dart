import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';

class TxtButton extends StatelessWidget{

  String text;
  VoidCallback onClick;
  TxtButton({super.key,required this.text,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onClick, child:Text(text,
    style:GoogleFonts.roboto(
      color:AppConstants.primaryTextColor,
      fontWeight:FontWeight.w400,
      fontSize:AppConstants.size9.sp,
      height:1
    ),

    ));
  }




}