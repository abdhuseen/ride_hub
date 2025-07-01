import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/widgets_controller/counter_controller.dart';
import 'package:ride_hub/controller/widgets_controller/payment_method_switch_button_controller.dart';
import 'package:ride_hub/validations/card_holder_name_validations.dart';
import 'package:ride_hub/validations/card_number_validations.dart';
import 'package:ride_hub/validations/cvv_validations.dart';
import 'package:ride_hub/validations/expriy_date_validations.dart';
import 'package:ride_hub/validations/purpose_of_reservations_validations.dart';
import 'package:ride_hub/view/app_widgets/buttons/counter.dart';
import 'package:ride_hub/view/app_widgets/buttons/payment_method_switch_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/input_text.dart';
import 'package:ride_hub/view/screens/rent_screens/previous_reservations_screen.dart';
import 'package:ride_hub/virual_data/data.dart';
import '../../app_widgets/buttons/my_back_button.dart';

class ReservationScreen extends StatelessWidget {
  ReservationScreen({super.key});

  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();
  final TextEditingController purposeOfReservationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paymentController = Provider.of<PaymentMethodSwitchButtonController>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(height: 67.h, child: MyBackButton(isFilled: false)),
        ),
        centerTitle: true,
        title: Text(
          AppLang.getLang(context: context).reservation,
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.w700,
            fontSize: AppConstants.size5.sp,
            height: 1,
            color: AppConstants.primaryTextColor2,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Number of days title
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 41.h),
                        child: Text(
                          AppLang.getLang(
                            context: context,
                          ).number_of_booking_days,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: AppConstants.size8.sp,
                            height: 1,
                          ),
                        ),
                      ),
                      // Counter
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 12.h),
                        child: Counter(),
                      ),
                      // Purpose input
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 32.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLang.getLang(
                                context: context,
                              ).purpose_of_reservation,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: AppConstants.size8.sp,
                                height: 1,
                                color: AppConstants.secondaryTextColor1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: InputText(
                                controller: purposeOfReservationController,
                                hintText: ".....................",
                                hintStyle: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppConstants.size8.sp,
                                  height: 1,
                                  color: AppConstants.secondaryTextColor8,
                                ),
                                textInputType: TextInputType.text,
                                indexOfInputField:9,

                              ),
                            ),
                          ],
                        ),
                      ),
                      // Payment method switch
                      Padding(
                        padding: EdgeInsets.only(left: 13.w, top: 41.h),
                        child: PaymentMethodSwitchButton(),
                      ),
                      // Visa details (if selected)
                      Consumer<PaymentMethodSwitchButtonController>(
                        builder: (context, value, child) {
                          if (value.paymentFlag == 1) {
                            return Padding(
                              padding: EdgeInsets.only(left: 11.w, top: 17.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLang.getLang(
                                      context: context,
                                    ).enter_card_details,
                                    style: GoogleFonts.mulish(
                                      fontSize: AppConstants.size4.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                      color: AppConstants.secondaryTextColor1,
                                    ),
                                  ),
                                  // Card holder
                                  Padding(
                                    padding: EdgeInsets.only(top: 28.h),
                                    child: Text(
                                      AppLang.getLang(
                                        context: context,
                                      ).card_holder,
                                      style: GoogleFonts.mulish(
                                        fontSize: AppConstants.size8.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                        color: AppConstants.secondaryTextColor1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InputText(
                                      controller: cardHolderController,
                                      hintText:
                                          AppLang.getLang(
                                            context: context,
                                          ).card_holder_name,
                                      hintStyle: GoogleFonts.mulish(
                                        fontSize: AppConstants.size8.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                        color: AppConstants.secondaryTextColor8,
                                      ),
                                      textInputType: TextInputType.text,
                                      indexOfInputField:4,
                                    ),
                                  ),
                                  // Card number
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: Text(
                                      AppLang.getLang(
                                        context: context,
                                      ).card_number,
                                      style: GoogleFonts.mulish(
                                        fontSize: AppConstants.size8.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                        color: AppConstants.secondaryTextColor1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: InputText(
                                      controller: cardNumberController,
                                      hintText: "XXXX XXXX XXXX XXXX",
                                      hintStyle: GoogleFonts.mulish(
                                        fontSize: AppConstants.size8.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                        color: AppConstants.secondaryTextColor8,
                                      ),
                                      textInputType: TextInputType.number,
                                      indexOfInputField:5,
                                    ),
                                  ),
                                  // Expiry & CVV
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: Row(
                                      children: [
                                        // Expiry
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLang.getLang(
                                                context: context,
                                              ).expiry_date,
                                              style: GoogleFonts.mulish(
                                                fontSize: AppConstants.size8.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                                color:
                                                    AppConstants
                                                        .secondaryTextColor1,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 5.h,
                                              ),
                                              child: InputText(
                                                controller: cardDateController,
                                                hintText: "06/23",
                                                hintStyle: GoogleFonts.mulish(
                                                  fontSize:
                                                      AppConstants.size9.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1,
                                                  color:
                                                      AppConstants
                                                          .hintTextColor3,
                                                ),
                                                textInputType:
                                                    TextInputType.datetime,
                                                isMini: true,
                                                indexOfInputField:6,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 24.w),
                                        // CVV
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLang.getLang(
                                                context: context,
                                              ).cvv,
                                              style: GoogleFonts.mulish(
                                                fontSize: AppConstants.size8.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                                color:
                                                    AppConstants
                                                        .secondaryTextColor1,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 5.h,
                                              ),
                                              child: InputText(
                                                controller: cardCvvController,
                                                hintText: "XXX",
                                                hintStyle: GoogleFonts.mulish(
                                                  fontSize:
                                                      AppConstants.size9.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1,
                                                  color:
                                                      AppConstants
                                                          .hintTextColor3,
                                                ),
                                                textInputType:
                                                    TextInputType.number,
                                                isMini: true,
                                                indexOfInputField:7,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      // Send request button
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 32.w,
                          top:
                              paymentController.paymentFlag == 0 ? 17.h : 133.h,
                          bottom: 40.h,
                        ),
                        child: PrimaryButton(
                          text: AppLang.getLang(context: context).send_request,
                          onClick: () {
                            //get data
                            int numberOfDays =Provider.of<CounterController>(context, listen: false,).counterValue; //always valid
                            String reservationPurpose = purposeOfReservationController.text.trim();
                            int paymentMethod = Provider.of<PaymentMethodSwitchButtonController>(context, listen: false,).paymentFlag; //0 for cash ,1 for visa card
                            if (paymentMethod == 0) {
                              //check validity in case cash payment method
                              bool isPurposeValid = PurposeOfReservationsValidations.isPurposeOfReservationsValid(reservationPurpose,);
                              if (isPurposeValid) {
                                //send request using cash payment method to server
                                Navigator.push(context,MaterialPageRoute(builder:(context) =>PreviousReservationsScreen(cars:cars),));

                              }
                            } else {
                              //in case visa card payment method
                              //get card data
                              String cardHolderName = cardHolderController.text.trim();
                              String cardNumber = cardNumberController.text.trim();
                              String expiryDate = cardDateController.text.trim();
                              String cvv = cardCvvController.text.trim();
                              //check validity
                              bool isPurposeValid =PurposeOfReservationsValidations.isPurposeOfReservationsValid(reservationPurpose,);
                              bool isCardHolderNameValid = CardHolderNameValidations.isCardHolderNameValid(cardHolderName,);
                              bool isCardNumberValid = CardNumberValidations.isCardNumberValid(cardNumber,);
                              bool isExpiryDateValid =ExpriyDateValidations.isExpriyDateValid(expiryDate);
                              bool isCvvValid=CvvValidations.isCvvValid(cvv);
                              bool isValidForRentRequest=isPurposeValid&&isCardHolderNameValid
                              &&isCardNumberValid&&isExpiryDateValid&&isCvvValid;
                              print(isPurposeValid);
                              print(isCardHolderNameValid);
                              print(isCardNumberValid);
                              print(isExpiryDateValid);
                              print(isCvvValid);
                              print(isValidForRentRequest);

                              if(isValidForRentRequest){
                                //send request to server then navigate to previous requests screen
                                Navigator.push(context,MaterialPageRoute(builder:(context) =>PreviousReservationsScreen(cars: cars),));

                              }


                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
