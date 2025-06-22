import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import '../../../controller/payment_method_switch_button_controller.dart';

class PaymentMethodSwitchButton extends StatelessWidget {
  const PaymentMethodSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodSwitchButtonController>(
      builder: (context, paymentMethodSwitchButtonController, child) {
        int paymentMethod = paymentMethodSwitchButtonController.paymentFlag;

        return Row(
          children: [
            GestureDetector(
              onTap: () {
                paymentMethodSwitchButtonController.setPaymentMethod(0);
              },
              child: Container(
                width: 182.w,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: paymentMethod == 0
                      ? AppConstants.starColor2
                      : AppConstants.secondaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppConstants.secondaryColor,
                    width: 1.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  AppLang.getLang(context: context).cash,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: AppConstants.size6.sp,
                    height: 1,
                    color: paymentMethod == 0
                        ? AppConstants.secondaryTextColor10
                        : AppConstants.secondaryTextColor9,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                paymentMethodSwitchButtonController.setPaymentMethod(1);
              },
              child:Container(
                width: 182.w,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: paymentMethod == 1
                      ? AppConstants.starColor2
                      : AppConstants.secondaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppConstants.secondaryColor,
                    width: 1.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  AppLang.getLang(context: context).card,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: AppConstants.size6.sp,
                    height: 1,
                    color: paymentMethod == 1
                        ? AppConstants.secondaryTextColor10
                        : AppConstants.secondaryTextColor9,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
