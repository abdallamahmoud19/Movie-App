import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../utils/assets_manger.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed.dart';
import '../home_screen/home_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'reset_password_screen';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.yellowColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Forget Password',
          style: AppStyle.regular16Yellow,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.07,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManger.forgetPasswordImage,
                height: height * 0.40,
                width: width * 0.40,
              ),
              CustomTextFiled(
                hintText: 'Email',
                style: AppStyle.regular16White,
                prefixIcon: Image.asset(AssetsManger.emailIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                text: 'Verify Email',
                textStyle: AppStyle.regular20Black,
                onButtonClicked: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
