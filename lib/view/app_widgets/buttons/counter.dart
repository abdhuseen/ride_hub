import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/controller/counter_controller.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterController>(
      builder: (context, counterController, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.w,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  counterController.increaseCounter();
                },
                icon: Icon(Icons.add,),
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              counterController.counterValue.toString(),
              style: GoogleFonts.mako(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.size3.sp,
                height: 1,
                color:AppConstants.secondaryTextColor1,
              ),
            ),
            SizedBox(width: 9.w),
            SizedBox(
              width: 40.w,
              height: 40.w,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  counterController.decreaseCounter();
                },
                icon: Icon(Icons.remove,),
              ),
            ),
          ],
        );
      },
    );
  }
}
