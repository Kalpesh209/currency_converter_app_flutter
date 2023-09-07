import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: TextButtonWidget
Purpose:TextButtonWidget
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class TextButtonWidget extends StatelessWidget {
  final Function onButtonTap;
  final String btnTxt;
  final Color btnBackColor;
  final Color txtColor;
  const TextButtonWidget({
    required this.onButtonTap,
    required this.btnTxt,
    required this.btnBackColor,
    required this.txtColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: btnBackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextButton(
        onPressed: () {
          onButtonTap();
        },
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: AppFontWeight.fontWeight500,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
