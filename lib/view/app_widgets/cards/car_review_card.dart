import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/model/reviews_model.dart';
import 'package:ride_hub/view/app_widgets/star_ratting_widget.dart';

class CarReviewCard extends StatelessWidget {
  ReviewsModel reviewsModel;
  CarReviewCard({super.key,required this.reviewsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:376.w,
      height:178.h,
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(8.r),
        border:Border.all(width:1,
        color:AppConstants.backgroundColor8
        )
      ),
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          //star widget
          Padding(padding:EdgeInsets.only(left:24.w,top:24.h) ,child: StarRattingWidget(numberOfStars:reviewsModel.starNumber,),),
          //review body
          Padding(padding:EdgeInsets.only(left:24.w,top:24.h) ,child:Text(reviewsModel.review,
          style:GoogleFonts.inter(
            fontWeight:FontWeight.w400,
            fontSize:AppConstants.size6.sp,
            height:1.4,
            color:AppConstants.secondaryTextColor3
          ),
          ),),
          //reviewer name
          Padding(padding:EdgeInsets.only(left:24.w,top:24.h) ,child:Text(reviewsModel.name,
            style:GoogleFonts.inter(
                fontWeight:FontWeight.w600,
                fontSize:AppConstants.size6.sp,
                height:1.4,
                color:AppConstants.secondaryTextColor4

            ),
          ),),
          //date
          Padding(padding:EdgeInsets.only(left:24.w,top:24.h) ,child:Text(reviewsModel.date,
            style:GoogleFonts.inter(
                fontWeight:FontWeight.w400,
                fontSize:AppConstants.size6.sp,
                height:1.4,
                color:AppConstants.secondaryTextColor5

            ),
          ),),


        ],
      ),


    );
  }
}
