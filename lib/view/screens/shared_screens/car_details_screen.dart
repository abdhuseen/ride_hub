import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/selection_controller.dart';
import 'package:ride_hub/view/app_widgets/buttons/home_button.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/custom_tab_bar.dart';
import 'package:ride_hub/view/screens/buy_screens/ratting_screen.dart';
import 'package:ride_hub/view/screens/rent_screens/reservation_screen.dart';
import 'package:ride_hub/virual_data/data.dart';

import '../../../constants/app_constants.dart';
import '../../../controller/widgets_controller/custom_tab_bar_controller.dart';
import '../../../model/car.dart';
import '../../app_widgets/buttons/my_back_button.dart';
import 'car_capabilities_screen.dart';
import 'car_general_info_screen.dart';
import 'car_images_screen.dart';
import 'car_reviews_screen.dart';



class CarDetailsScreen extends StatelessWidget {
  Car car;
   CarDetailsScreen({super.key,required this.car});


  @override
  @override
  Widget build(BuildContext context) {
    SelectionController selectionController =
    Provider.of<SelectionController>(context, listen: false);
    return  Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 67.h,
              child: MyBackButton(isFilled: false),
            ),
          ),
          centerTitle: true,
          title: Row(
            children: [
              Spacer(),
              Text(
                car.name,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w700,
                  fontSize: AppConstants.size5.sp,
                  height: 1,
                  color: AppConstants.primaryTextColor,
                ),
              ),
              Spacer(),
              HomeButton()
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            //TabBar
             CustomTabBar(numberOfTabs:4, tabsTitles:["General","Capabilities","Images","Reviews"]),
             SizedBox(height: 10.h),
             //car image , model , price or rent cost
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Car image
                    SizedBox(
                      width: 220.w,
                      height: 107.h,
                      child: Image.asset(
                        car.imagesLinks[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Container with details
                    Container(
                      width:380.w,
                      height:156.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: AppConstants.backgroundColor6,
                      ),
                      padding: EdgeInsets.all(16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Car model
                          Row(
                            children: [
                              Text(
                                car.model,
                                style: GoogleFonts.mako(
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppConstants.size5.sp,
                                  height: 1,
                                  color: AppConstants.secondaryTextColor1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:10.h),
                          // Price or rent cost
                          Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: [
                              Text(
                                selectionController.selectedFlag == 0
                                    ? "${car.rentCost}${AppLang.getLang(context: context).jd_day}"
                                    : "${car.price}${AppLang.getLang(context: context).jd}",
                                style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppConstants.size8.sp,
                                  height: 1,
                                  color: AppConstants.backgroundColor2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            //display selected screen of tab bar
            Consumer<CustomTabBarController>(builder:(context,customTabBarController, child) {
              return Expanded(
                child:customTabBarController.selectedIndex==0?CarGeneralInfoScreen(car:car,):customTabBarController.selectedIndex==1?CarCapabilitiesScreen(car:car,):customTabBarController.selectedIndex==2?CarImagesScreen(car:car,):CarReviewsScreen(reviewsModel:carReviews,),
              );
            },),
          ],
        ),
        bottomNavigationBar:Padding(padding:EdgeInsets.only(left:19.w,right:29.w,top:26.h,bottom:31.h),
        child:selectionController.selectedFlag==0?PrimaryButton(text:AppLang.getLang(context: context).book_now, onClick:(){
          //in rent case go to reservation screen
          Navigator.push(context,MaterialPageRoute(builder:(context) =>ReservationScreen(),));


        }):PrimaryButton(text:AppLang.getLang(context: context).rate, onClick:(){
          //in buy case go to rate screen
          Navigator.push(context,MaterialPageRoute(builder:(context) =>RattingScreen(),));

        }),
        )
      );

  }


}
