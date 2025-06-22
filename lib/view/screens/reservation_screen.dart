import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/payment_method_switch_button_controller.dart';
import 'package:ride_hub/view/app_widgets/buttons/counter.dart';
import 'package:ride_hub/view/app_widgets/buttons/payment_method_switch_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/inputs/input_text.dart';

import '../app_widgets/buttons/my_back_button.dart';

class ReservationScreen extends StatelessWidget {
   ReservationScreen({super.key});
  TextEditingController cardHolderController=TextEditingController();
  TextEditingController cardNumberController=TextEditingController();
  TextEditingController cardDateController=TextEditingController();
  TextEditingController cardCvvController=TextEditingController();
  TextEditingController purposeOfReservationController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    PaymentMethodSwitchButtonController paymentMethodSwitchButtonController=Provider.of(context,listen: false);
    int paymentMethod=paymentMethodSwitchButtonController.paymentFlag;//0 for cash 1for visa
    return Scaffold(
      //back button
      appBar:AppBar(
        leading:Padding(
          padding: EdgeInsets.only(left: 24.w),
          child:SizedBox(
            height: 67.h,
            child:MyBackButton(isFilled: false),
          ),
        ),
        centerTitle:true,
        title:Text(AppLang.getLang(context: context).reservation,
          style:GoogleFonts.mulish(
            fontWeight:FontWeight.w700,
            fontSize:AppConstants.size5.sp,
            height:1,
            color:AppConstants.primaryTextColor2
          ),

        ),
      ),
      body:SafeArea(child:SingleChildScrollView(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            //number of days hint text
            Padding(padding:EdgeInsets.only(left:24.w,top:41.h),
            child:Text(AppLang.getLang(context: context).number_of_booking_days,
            style:GoogleFonts.mulish(
              fontWeight:FontWeight.w400,
              fontSize:AppConstants.size8.sp,
              height:1
            ),
            ),
            ),
            //counter
            Padding(padding:EdgeInsets.only(left:24.w,top:12.h),
              child:Counter(),
            ),
            //purpose of reservation hint text and input text
            Padding(padding:EdgeInsets.only(left:24.w,top:32.h),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(AppLang.getLang(context: context).purpose_of_reservation,
              style:GoogleFonts.mulish(
                fontWeight:FontWeight.w400,
                fontSize:AppConstants.size8.sp,
                height:1,
                color:AppConstants.secondaryTextColor1
              ),

              ),
              //purpose of reservation input text
              Padding(padding:EdgeInsets.only(top:5.h),
              child:InputText(
                controller: purposeOfReservationController,
                  hintText:".....................",
                  hintStyle:GoogleFonts.mulish(
                      fontWeight:FontWeight.w400,
                      fontSize:AppConstants.size8.sp,
                      height:1,
                      color:AppConstants.secondaryTextColor8
                  ),
                  textInputType:TextInputType.text),

              )
            ],
          ),


        ),
            //payment method
            Padding(padding:EdgeInsets.only(left:13.w,top:41.h),
              child:PaymentMethodSwitchButton(),
            ),
            //hint text and visa card details in case user select visa
           Consumer<PaymentMethodSwitchButtonController>(builder:(context, value, child) {
             return value.paymentFlag==1?Padding(padding:EdgeInsets.only(left:11.w,top:17.h),
                 child:Column(
                   crossAxisAlignment:CrossAxisAlignment.start,
                   children: [
                     //enter details hint text
                     Text(AppLang.getLang(context: context).enter_card_details,
                       style:GoogleFonts.mulish(
                           fontSize:AppConstants.size4.sp,
                           fontWeight:FontWeight.w400,
                           height:1,
                           color:AppConstants.secondaryTextColor1
                       ),
                     ),
                     //card details
                     //--------------------------
                     //card holder hint
                     Padding(padding:EdgeInsets.only(top:28.h),
                       child:Text(AppLang.getLang(context: context).card_holder,
                         style:GoogleFonts.mulish(
                             fontSize:AppConstants.size8.sp,
                             fontWeight:FontWeight.w400,
                             height:1,
                             color:AppConstants.secondaryTextColor1
                         ),

                       ),
                     ),
                     //card holder input text
                     Padding(padding:EdgeInsets.only(top:5.h),
                       child:InputText(
                           controller:cardHolderController,
                           hintText:AppLang.getLang(context: context).card_holder_name,
                           hintStyle:GoogleFonts.mulish(
                               fontSize:AppConstants.size8.sp,
                               fontWeight:FontWeight.w400,
                               height:1,
                               color:AppConstants.secondaryTextColor8
                           ),
                           textInputType:TextInputType.text),
                     ),
                     //card number hint
                     Padding(padding:EdgeInsets.only(top:12.h),
                       child:Text(AppLang.getLang(context: context).card_number,
                         style:GoogleFonts.mulish(
                             fontSize:AppConstants.size8.sp,
                             fontWeight:FontWeight.w400,
                             height:1,
                             color:AppConstants.secondaryTextColor1
                         ),

                       ),
                     ),
                     //card number input text
                     Padding(padding:EdgeInsets.only(top:5.h),
                       child:InputText(
                           controller:cardNumberController,
                           hintText:"XXXX XXXX XXXX XXXX",
                           hintStyle:GoogleFonts.mulish(
                               fontSize:AppConstants.size8.sp,
                               fontWeight:FontWeight.w400,
                               height:1,
                               color:AppConstants.secondaryTextColor8
                           ),
                           textInputType:TextInputType.number),
                     ),
                     //expiry date and cvv
                     Padding(padding:EdgeInsets.only(top:12.h),
                      child:Row(
                       mainAxisAlignment:MainAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             //card expiry date hint
                             Padding(padding:EdgeInsets.only(top:0.h),
                               child:Text(AppLang.getLang(context: context).expiry_date,
                                 style:GoogleFonts.mulish(
                                     fontSize:AppConstants.size8.sp,
                                     fontWeight:FontWeight.w400,
                                     height:1,
                                     color:AppConstants.secondaryTextColor1
                                 ),

                               ),
                             ),
                             //card expiry date input text
                             Padding(padding:EdgeInsets.only(top:5.h),
                               child:InputText(
                                       controller:cardDateController,
                                       hintText:"06/23",
                                       hintStyle:GoogleFonts.mulish(
                                       fontSize:AppConstants.size9.sp,
                                       fontWeight:FontWeight.w400,
                                       height:1,
                                       color:AppConstants.hintTextColor3
                                   ),
                                   textInputType:TextInputType.datetime,
                                   isMini:true,

                               ),

                             ),
                           ],
                         ),
                         SizedBox(width:24.w,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             //cvv hint
                             Padding(padding:EdgeInsets.only(top:0.h),
                               child:Text(AppLang.getLang(context: context).cvv,
                                 style:GoogleFonts.mulish(
                                     fontSize:AppConstants.size8.sp,
                                     fontWeight:FontWeight.w400,
                                     height:1,
                                     color:AppConstants.secondaryTextColor1
                                 ),

                               ),
                             ),
                             //cvv input text
                             Padding(padding:EdgeInsets.only(top:5.h),
                               child:InputText(
                                       controller:cardCvvController,
                                       hintText:"XXX",
                                       hintStyle:GoogleFonts.mulish(
                                       fontSize:AppConstants.size9.sp,
                                       fontWeight:FontWeight.w400,
                                       height:1,
                                       color:AppConstants.hintTextColor3
                                   ),
                                   textInputType:TextInputType.number,
                                   isMini:true,
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                     )

                   ],
                 )


             ):SizedBox.shrink();

           },),
            //send request button
            Padding(padding:EdgeInsets.only(left:16.w,right:32.w,
            top:paymentMethod==0?17.h:133.h,
            ),
            child:PrimaryButton(text:AppLang.getLang(context: context).send_request, onClick:(){}),
            )
          ],
        ),

      )),
    );
  }
}
