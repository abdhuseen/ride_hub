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
    SelectionController selectionController =
    Provider.of<SelectionController>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child:ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500.w, // cap content width for tablets
                  ),
                  child:Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      // app logo image
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight > constraints.maxWidth
                              ? 120.h
                              : 60.h, // reduce top padding in landscape
                        ),
                        child: Image.asset(
                          "assets/images/app_logo.png",
                          width: 300.w,
                          height: 300.w, // make it square
                        ),
                      ),
                      // buy a car button
                      Padding(
                        padding: EdgeInsets.only(top: 36.h),
                        child: PrimaryButton(
                          text: AppLang.getLang(context: context).buy_a_car,
                          onClick: () {
                            selectionController.changeFlag(1);
                          },
                        ),
                      ),
                      // rent a car button
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: PrimaryButton(
                          text: AppLang.getLang(context: context).rental_a_car,
                          onClick: () {
                            selectionController.changeFlag(0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
