import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/login_controller.dart';
import 'package:ride_hub/controller/selection_controller.dart';
import 'package:ride_hub/view/screens/login_screen.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926), // your Figma base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(providers:[
          ChangeNotifierProvider(create:(context) => SelectionController(),),
          ChangeNotifierProvider(create:(context) => LoginController(),),

        ],
        child: MaterialApp(
          title: 'Ride Hub',
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
          home: child,
        ),

        );
      },
      child:LoginScreen(),
    );
  }
}


