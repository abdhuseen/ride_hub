import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/counter_controller.dart';
import 'package:ride_hub/controller/error_text_controller.dart';
import 'package:ride_hub/controller/gender_controller.dart';
import 'package:ride_hub/controller/login_controller.dart';
import 'package:ride_hub/controller/selection_controller.dart';
import 'package:ride_hub/controller/upload_image_controller.dart';
import 'package:ride_hub/view/app_widgets/inputs/email_box.dart';
import 'package:ride_hub/view/app_widgets/inputs/main_box.dart';
import 'package:ride_hub/view/app_widgets/inputs/update_password_box.dart';
import 'package:ride_hub/view/app_widgets/inputs/upload_photo_box.dart';
import 'package:ride_hub/view/app_widgets/inputs/verify_box.dart';
import 'package:ride_hub/view/screens/home_view.dart';
import 'package:ride_hub/view/screens/login_screen.dart';
import 'package:ride_hub/view/screens/reservation_screen.dart';
import 'package:ride_hub/view/screens/selection_screen.dart';
import 'package:ride_hub/view/screens/sign_up_screen.dart';
import 'package:ride_hub/view/screens/splash_screen.dart';
import 'package:ride_hub/view/screens/successful_reservation_screen.dart';

import 'controller/car_controller.dart';
import 'controller/filter_controller.dart';
import 'controller/payment_method_switch_button_controller.dart';
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

          ChangeNotifierProvider(create:(context) =>PaymentMethodSwitchButtonController(),
          ),
          ChangeNotifierProvider(create: (context) => CarController()),
          ChangeNotifierProvider(create: (context) => FilterController()),

          ChangeNotifierProvider(create:(context) =>PaymentMethodSwitchButtonController(),),
          ChangeNotifierProvider(create:(context) =>UploadImageController(),),
          ChangeNotifierProvider(create:(context) =>ErrorTextController(),),



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


