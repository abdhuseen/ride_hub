import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';

class MainBox extends StatelessWidget {
  Widget child;
   MainBox({super.key,required this. child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:348.w,
      decoration:BoxDecoration(
        color:AppConstants.secondaryColor,
        borderRadius:BorderRadius.circular(8.r),
        border:Border.all(
          width:4,
          color:AppConstants.secondaryColor2
        )


      ),
     child:Column(
       children:[
         child
       ]
     ),
    );
  }
}
