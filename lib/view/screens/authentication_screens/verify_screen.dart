import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/view/app_widgets/inputs/email_box.dart';
import 'package:ride_hub/view/app_widgets/inputs/verify_box.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:constraints.maxHeight,
                  maxWidth: 500.w,
                ),
                child:Center(
                  child:VerifyBox(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}