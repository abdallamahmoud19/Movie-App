
import 'package:flutter/material.dart';


import '../utils/app_colors.dart';
import '../utils/app_style.dart';

class CustomTextFiled extends StatelessWidget {
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextFiled({this.keyboardType = TextInputType.text,
    this.borderColor,
    this.controller,
    this.validator,
    this.maxLines,
    required this.hintText,
    this.labelText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.style,
    this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        cursorColor: AppColor.blackColor,
        maxLines: maxLines ?? 1,
        obscureText: obscureText,
        style: style ?? AppStyle.regular16Black,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: hintStyle ?? AppStyle.regular16White,
            labelStyle: labelStyle,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColor.greyColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: borderColor ?? AppColor.greyColor, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: borderColor ?? AppColor.greyColor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                const BorderSide(color: AppColor.redColor, width: 2)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: borderColor ?? AppColor.greyColor, width: 2))));
  }
}
