import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleImage extends StatelessWidget {
  String imgLink;
   CircleImage({super.key,required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40.r,
      backgroundImage: AssetImage(imgLink),
    );
  }
}
