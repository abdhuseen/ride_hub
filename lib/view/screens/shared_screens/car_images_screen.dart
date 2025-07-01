import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/view/app_widgets/cards/car_images_card.dart';

import '../../../model/car.dart';



class CarImagesScreen extends StatelessWidget {
  Car car;
  CarImagesScreen({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:// Cars horizontal list
      SizedBox(
        height: 220.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: car.imagesLinks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, right: index == car.imagesLinks.length - 1 ? 16.w : 0),
              child:CarImagesCard(imgLink:car.imagesLinks[index])
            );
          },
        ),
      ),

    );
  }
}
