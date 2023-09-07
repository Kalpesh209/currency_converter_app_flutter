import 'dart:async';

import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_size.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_images.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_strings.dart';
import 'package:currency_converter_app_flutter/Presentation/screens/Home/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: SplashScreen
Purpose:To Display a Splash Screen on a App
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timerFunction();
    super.initState();
  }

  timerFunction() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.primaryAppColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currencyConvertImages(),
              SizedBox(
                height: 10,
              ),
              appNameWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appNameWidget() {
    return Text(
      AppStrings.appName,
      style: TextStyle(
        fontSize: AppFontSize.fontSize34,
        fontWeight: FontWeight.w600,
        color: AppColors.colorWhite,
      ),
    );
  }

  Widget currencyConvertImages() {
    return Image.asset(
      AppImages.currencyImg,
    );
  }
}
