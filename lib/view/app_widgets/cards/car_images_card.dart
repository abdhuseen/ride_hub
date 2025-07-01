import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarImagesCard extends StatelessWidget {
  String imgLink;
   CarImagesCard({super.key,required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:550.w,
        height:400.h,
        child: Image.asset(
          imgLink,
          fit:BoxFit.fill,
        ),
      );
  }
}
