import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/view/screens/onboarding_screens/selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds:3,
      ),
        (){

        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>SelectionScreen(),));

        }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Image.asset("assets/images/app_logo.png",
          width:494.w,
          height:494.h,
        ),
      ),

    );
  }
}
