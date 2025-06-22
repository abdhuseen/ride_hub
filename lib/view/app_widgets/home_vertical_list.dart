import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

class HomeVerticalList extends StatelessWidget {
  String listTitle;
  List<Office> officeList;

  HomeVerticalList({super.key, required this.listTitle,required this.officeList});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: listTitle,
              fontSize: AppConstants.size5.sp,
              FontFamily: 'Mulish-Bold',
              textColor: AppConstants.primaryTextColor,
            ),
            TextButton(
              onPressed: () {},
              child: BaseText(
                text: "${AppLang.getLang(context: context).see_all} >",
                fontSize: AppConstants.size6.sp,
                FontFamily: 'Roboto-Regular',
                textColor: AppConstants.primaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 380.w,
          height: 119.h,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        officeList[index].imgLink,
                        height: 48.h,
                        width: 48.w,
                      ),
                      SizedBox(height: 5),
                      BaseText(
                        text: officeList[index].name,
                        fontSize: AppConstants.size8.sp,
                        FontFamily: 'Mulish-Regular',
                        textColor: AppConstants.primaryTextColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
