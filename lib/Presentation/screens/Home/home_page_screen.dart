import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_constants.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_size.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_weight.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_images.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_strings.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_utilities.dart';
import 'package:currency_converter_app_flutter/Helper/currency_converter_helper_api.dart';
import 'package:currency_converter_app_flutter/Models/currency_converter_model.dart';
import 'package:currency_converter_app_flutter/Presentation/widgets/text_button_widget.dart';
import 'package:currency_converter_app_flutter/Presentation/widgets/text_form_field_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: HomePageScreen
Purpose:HomePageScreen
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Future<CurrencyConvertModel?> future;
  bool isAmountVisible = true;
  String fromCurrency = "USD - United States Dollar";
  String toCurrency = "INR - Indian Rupee";
  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    future = CurrencyConvertHelperAPI.currencyAPI.currencyConvertorAPI(
      from: "USD",
      to: "INR",
      amt: 1,
    );
    amountController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // All function & methods will go above  build()

  onConvertTap() {
    if (amountController.text.isEmpty) {
      AppUtilities(context).showTextSnackBar(AppStrings.pleaseEnterAmount);
    } else {
      int amt = int.parse(amountController.text);
      var newFromCurrency = fromCurrency.substring(0, 3);
      var newToCurrency = toCurrency.substring(0, 3);

      setState(() {
        future = CurrencyConvertHelperAPI.currencyAPI.currencyConvertorAPI(
          from: newFromCurrency,
          to: newToCurrency,
          amt: amt,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            CurrencyConvertModel? currencyConvertModel = snapshot.data;
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fromTextWidget(),
                      SizedBox(
                        height: 10.h,
                      ),
                      fromCurrencyPicker(),
                      SizedBox(
                        height: 20.h,
                      ),
                      toTextButtons(),
                      SizedBox(
                        height: 10.h,
                      ),
                      toCurrencyPicker(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: isAmountVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            amountTextWidget(),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormFieldWidget(
                              controller: amountController,
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.number,
                              isPasswordField: false,
                              onFieldSubmitted: (String value) {},
                              validator: (p0) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButtonWidget(
                        btnTxt: AppStrings.convert,
                        btnBackColor: AppColors.primaryAppColor,
                        txtColor: AppColors.colorWhite,
                        onButtonTap: () {
                          if (fromCurrency == toCurrency) {
                            setState(() {
                              isAmountVisible = false;
                            });
                            AppUtilities(context)
                                .showTextSnackBar(AppStrings.sameCurrency);
                          } else {
                            setState(() {
                              isAmountVisible = true;
                            });
                            onConvertTap();
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Visibility(
                        visible: isAmountVisible,
                        child: resultWidget(currencyConvertModel!),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryAppColor,
            ),
          );
        },
      ),
    );
  }

  // All Design widget will go below build()

  Widget resultWidget(CurrencyConvertModel convertModel) {
    return Container(
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // color: Global.appColor.withOpacity(0.2),
      ),
      child: Text(
        "${AppStrings.result} : ${convertModel.difference.toString()}",
        style: TextStyle(
          // color: Global.appColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget amountTextWidget() {
    return Text(
      AppStrings.amount,
      style: TextStyle(
        fontSize: 15.h,
        fontWeight: AppFontWeight.fontWeight700,
      ),
    );
  }

  Widget fromCurrencyPicker() {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border.all(
          color: AppColors.colorGrey,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: fromCurrency,
              onChanged: (val) {
                setState(() {
                  fromCurrency = val!;
                });
              },
              items: AppConstants.currency.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: AppColors.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.fontSize18,
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: AppFontSize.fontSize34,
                color: AppColors.colorBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget toCurrencyPicker() {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border.all(
          color: AppColors.colorGrey,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: toCurrency,
              onChanged: (val) {
                setState(() {
                  toCurrency = val!;
                });
              },
              items: AppConstants.currency.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: AppColors.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.fontSize18,
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: AppFontSize.fontSize34,
                color: AppColors.colorBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget currencyConvertImages() {
    return Image.asset(
      AppImages.currencyImg,
    );
  }

  Widget toTextButtons() {
    return Text(
      AppStrings.to,
      style: TextStyle(
        fontSize: 15.h,
        fontWeight: AppFontWeight.fontWeight700,
      ),
    );
  }

  Widget fromTextWidget() {
    return Text(
      AppStrings.from,
      style: TextStyle(
        fontSize: 15.h,
        fontWeight: AppFontWeight.fontWeight700,
      ),
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      centerTitle: true,
      title: appBarTextWidget(),
    );
  }

  Widget appBarTextWidget() {
    return Text(
      AppStrings.appName,
      style: TextStyle(
        fontSize: AppFontSize.fontSize20,
        fontWeight: AppFontWeight.fontWeight600,
      ),
    );
  }
}
