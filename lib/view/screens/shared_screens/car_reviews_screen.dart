import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/view/app_widgets/cards/car_review_card.dart';

import '../../../model/reviews_model.dart';



class  CarReviewsScreen extends StatelessWidget {
   List<ReviewsModel> reviewsModel;
   CarReviewsScreen({super.key,required this.reviewsModel});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:// reviews horizontal list
      SizedBox(
        height: 220.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reviewsModel.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: 16.w, right: index == reviewsModel.length - 1 ? 16.w : 0),
                child:CarReviewCard(reviewsModel:reviewsModel[index],)
            );
          },
        ),
      ),

    );
  }
}
