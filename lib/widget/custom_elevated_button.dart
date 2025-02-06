import 'package:flutter/material.dart';


import '../utils/app_colors.dart';
import '../utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Widget? prefixIconButton;
  String text;

  TextStyle? textStyle;
  Function onButtonClicked;

  CustomElevatedButton(
      {this.backgroundColor,
        this.prefixIconButton,
        required this.text,
        this.textStyle,
        required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.02),
            backgroundColor: backgroundColor ?? AppColor.yellowColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: AppColor.yellowColor,
                  width: 2,
                ))),
        onPressed: () {
          onButtonClicked();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIconButton ?? SizedBox(),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              text,
              style: textStyle ?? AppStyle.regular16Black,
            )
          ],
        ));
  }
}
