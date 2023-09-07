import 'package:currency_converter_app_flutter/AppUtils/app_colors.dart';
import 'package:currency_converter_app_flutter/AppUtils/app_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Title: TextFormFieldWidget
Purpose:TextFormFieldWidget
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPasswordField;
  final bool? isPhoneField;
  final TextInputAction inputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final Function()? onTextFieldTap;
  final Widget? suffixIcon;
  final bool isRead;
  final int maxline;
  TextFormFieldWidget({
    required this.controller,
    required this.isPasswordField,
    required this.inputAction,
    required this.onFieldSubmitted,
    required this.validator,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.hint = '',
    this.focusNode,
    this.isPhoneField,
    this.enabled = true,
    this.isRead = false,
    this.suffixIcon,
    this.onTextFieldTap,
    this.maxline = 1,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              showCursor: true,
              readOnly: widget.isRead,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: AppFontWeight.fontWeight700,
              ),
              validator: (value) {
                return widget.validator!(value);
              },
              focusNode: widget.focusNode,
              textAlignVertical: TextAlignVertical.bottom,
              keyboardType: widget.textInputType,
              autocorrect: false,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              autovalidateMode: AutovalidateMode.disabled,
              enableSuggestions: false,
              textInputAction: widget.inputAction,
              inputFormatters: [
                // widget.isPhoneField == true
                //     ? FilteringTextInputFormatter.digitsOnly
                //     : FilteringTextInputFormatter.singleLineFormatter
              ],
              maxLength: widget.isPhoneField == true ? 10 : null,
              enabled: widget.enabled,
              maxLines: widget.maxline,
              decoration: _getNormalInputDecoration(),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _getNormalInputDecoration() {
    return InputDecoration(
      hintText: widget.hint,
      // hintStyle: MavenTextStyles.nunitoRegular.copyWith(
      //   fontSize: 14,
      //   color: AppColors.kFontColor,
      // ),
      isDense: true,
      contentPadding: EdgeInsets.only(
        left: 14,
        top: 10.5,
        bottom: 10.5,
        right: 14,
      ),
      suffixIcon: widget.suffixIcon,
      border: InputBorder.none,
      /*enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.kDropDownBackColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        borderSide: BorderSide(
          color: AppColors.kDropDownBackColor,
          style: BorderStyle.solid,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        borderSide: BorderSide(
          color: AppColors.kDropDownBackColor,
          style: BorderStyle.solid,
        ),
      ),*/
    );
  }
}
