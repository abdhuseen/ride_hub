import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';

class TxtButton extends StatelessWidget{

  String text;
  VoidCallback onClick;
  TextStyle textStyle;
  TxtButton({super.key,required this.text,required this.onClick,required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onClick, child:Text(text,
    style:textStyle,

    ));
  }




}