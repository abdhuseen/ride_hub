import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/selection_controller.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SelectionController selectionController=Provider.of<SelectionController>(context,listen: false);

    return Scaffold(

      body:Center(
          child:Column(
            children: [
              //app logo image
              Padding(padding:EdgeInsets.fromLTRB(33.w,152.h,33.w,0),
                child:Image.asset("assets/images/app_logo.png",
                  width:494.w,
                  height:494.h,
                ),
              ),
              //buy a car button
              Padding(padding:EdgeInsets.fromLTRB(57.w,27.h,57.w,0),
                child:PrimaryButton(text:AppLang.getLang(context: context).buy_a_car, onClick:(){

                  selectionController.changeFlag(1);

                }),
              ),
              //rent a car button
              Padding(padding:EdgeInsets.fromLTRB(57.w,27.h,57.w,0),
                child:PrimaryButton(text:AppLang.getLang(context: context).rental_a_car, onClick:(){

                  selectionController.changeFlag(0);

                }),

              )
            ],
          )



      )






    );
  }
}
