
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/view/screens/review_result_view.dart';

import '../../constants/app_lang.dart';
import '../../model/car_details_model.dart';
import '../app_widgets/buttons/my_back_button.dart';
import '../app_widgets/buttons/primary_button.dart';




class CarRatingView extends StatefulWidget {
  final CarDetailModel car;

  const CarRatingView({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  State<CarRatingView> createState() => _CarRatingViewState();
}

class _CarRatingViewState extends State<CarRatingView> {
  int selectedRating = 0;
  String selectedReason = '';
  final TextEditingController _summaryController = TextEditingController();

  @override
  void dispose() {
    _summaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final List<String> reasons = [
      AppLang.getLang(context: context).general_experience,
      AppLang.getLang(context: context).former_owner,
      AppLang.getLang(context: context).test_drive,
    ];
    return Scaffold(
      backgroundColor:AppConstants.secondaryColor,
      appBar: AppBar(
        title: Text(
          AppLang.getLang(context: context).car_rating,
          style: GoogleFonts.mulish(
            color: Colors.black,
            fontSize: AppConstants.size5,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppConstants.secondaryColor,
        elevation: 0,
        leading: Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: MyBackButton(isFilled: false),
    ),

    ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reason for evaluation section
            Text(
              AppLang.getLang(context: context).reason_for_evaluation,
              style: GoogleFonts.mulish(
                fontSize: AppConstants.size6,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),


            Column(
              children: reasons.map((reason) {
                bool isSelected = selectedReason == reason;

                return Container(


                  margin:  EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedReason = reason;
                      });
                    },
                    child: Container(
                      width:180.w ,
                      height:50.h,
                      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: isSelected ? AppConstants.backgroundColor2 : AppConstants.starColor2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        reason,
                        style:  GoogleFonts.mulish(
                          color:AppConstants. secondaryColor,
                          fontSize: AppConstants.size8,

                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 32.h),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRating = index + 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.h),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: index < selectedRating ? AppConstants.backgroundColor2 : AppConstants.starColor2,  // ✅ أسود أو أخضر
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      Icons.star,
                      color: AppConstants.secondaryColor,
                      size:  AppConstants.size4,
                    ),
                  ),
                );
              }),
            ),

         SizedBox(height: 32.h),

            // Summary section
             Text(
              AppLang.getLang(context: context).summary_of_your_experience,
              style: GoogleFonts.mulish(
                fontSize: AppConstants.size6,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
         SizedBox(height: 12.h),

            // Text input area
            Container(
              width: 368.w,
              height: 170.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: _summaryController,
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:  EdgeInsets.all(16),
                  hintText: 'Write your experience here...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize:  AppConstants.size8,
                  ),
                ),
                style: GoogleFonts.mulish(
                  fontSize: AppConstants.size8,
                  color:AppConstants.primaryTextColor2,
                ),
              ),
            ),

           SizedBox(height: 40.h),
          ],
        ),
      ),

      // Submit button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50.h,
            child:PrimaryButton(
              text:AppLang.getLang(context: context). submit,
                onClick: () {},
            ),

          ),
        ),
      ),
    );
  }


}
