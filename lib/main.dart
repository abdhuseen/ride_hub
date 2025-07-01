import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/controller/widgets_controller/counter_controller.dart';
import 'package:ride_hub/controller/widgets_controller/error_text_controller.dart';
import 'package:ride_hub/controller/widgets_controller/gender_controller.dart';
import 'package:ride_hub/controller/login_controller.dart';
import 'package:ride_hub/controller/selection_controller.dart';
import 'package:ride_hub/controller/widgets_controller/upload_image_controller.dart';
import 'package:ride_hub/view/screens/onboarding_screens/splash_screen.dart';
import 'controller/widgets_controller/brand_card_controller.dart';
import 'controller/widgets_controller/custom_tab_bar_controller.dart';
import 'controller/widgets_controller/drop_down_menu_button_controller.dart';
import 'controller/widgets_controller/payment_method_switch_button_controller.dart';
import 'controller/widgets_controller/range_slider_controller.dart';
import 'controller/widgets_controller/resons_evaluation_widget_controller.dart';
import 'controller/widgets_controller/star_ratting_widget_controller.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926), // your Figma base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(providers:[
          ChangeNotifierProvider(create:(context) => SelectionController(),),
          ChangeNotifierProvider(create:(context) => LoginController(),),
          ChangeNotifierProvider(create:(context) =>GenderController(),),
          ChangeNotifierProvider(create:(context) =>CounterController(),),
          ChangeNotifierProvider(create:(context) =>PaymentMethodSwitchButtonController(),),
          ChangeNotifierProvider(create:(context) =>PaymentMethodSwitchButtonController(),),
          ChangeNotifierProvider(create:(context) =>UploadImageController(),),
          ChangeNotifierProvider(create:(context) =>ErrorTextController(),),
          ChangeNotifierProvider(create:(context) => CustomTabBarController(),),
          ChangeNotifierProvider(create:(context) =>  StarRattingWidgetController(),),
          ChangeNotifierProvider(create:(context) =>  ResonsEvaluationWidgetController(),),
          ChangeNotifierProvider(create:(context) => BrandCardController(),),
          ChangeNotifierProvider(create:(context) =>DropDownMenuButtonController(),),
          ChangeNotifierProvider(create:(context) =>RangeSliderController(),),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:'Ride Hub',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          home:child,
        ),

        );
      },
      child:SplashScreen()
    );
  }
}


