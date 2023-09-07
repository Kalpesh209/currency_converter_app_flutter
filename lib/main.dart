import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_strings.dart';
import 'package:currency_converter_app_flutter/Presentation/screens/Home/home_page_screen.dart';
import 'package:currency_converter_app_flutter/Presentation/screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: Entry Point of a App
Purpose:Entry Point of a App
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.colorPurple,
            ),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
