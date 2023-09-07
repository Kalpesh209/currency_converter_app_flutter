import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: AppUtilities
Purpose:AppUtilities used through App
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class AppUtilities {
  BuildContext context;
  AppUtilities(
    this.context,
  );

  void dismissKeyboard() => FocusScope.of(context).unfocus();

  void showTextSnackBar(String text) {
    var textWidget = Text(
      text,
      style: TextStyle(
        fontSize: 15.h,
        fontWeight: AppFontWeight.fontWeight700,
      ),
    );
    var snackBar = SnackBar(
      content: textWidget,
      backgroundColor: AppColors.primaryAppColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
