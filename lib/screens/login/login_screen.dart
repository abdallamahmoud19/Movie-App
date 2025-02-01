import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../utils/assets_manger.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed.dart';
import '../home_screen/home_screen.dart';
import '../register_screen/register_screen.dart';
import '../reset_password_screen/reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SingleChildScrollView(
        // This part ensures the entire screen is scrollable
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.07,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManger.loginImage, height: height * 0.20),
              CustomTextFiled(
                hintText: 'Email',
                style: AppStyle.regular16White,
                prefixIcon: Image.asset(AssetsManger.emailIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                hintText: 'Password',
                style: AppStyle.regular16White,
                obscureText: true,
                suffixIcon: Image.asset(AssetsManger.showPassIcon),
                prefixIcon: Image.asset(AssetsManger.passIcon),
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen.routeName);
                },
                child: Text(
                  'Forget Password?',
                  textAlign: TextAlign.end,
                  style: AppStyle.regular14Yellow,
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                text: 'Login',
                onButtonClicked: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t Have Account ? ',
                        style: AppStyle.regular16White,
                      ),
                      TextSpan(
                        text: 'Create One ',
                        style: AppStyle.regular14Yellow,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: AppColor.yellowColor,
                      endIndent: 20,
                      indent: 10,
                    ),
                  ),
                  Text(
                    'OR',
                    style: AppStyle.regular14Yellow,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: AppColor.yellowColor,
                      indent: 20,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                prefixIconButton: Image.asset(AssetsManger.googleIcon),
                text: 'Login With Google',
                onButtonClicked: () {
                  print('Button Clicked');
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: height * 0.01, vertical: width * 0.01),
                    decoration: BoxDecoration(
                      color: AppColor.blackColor,
                      border: Border.all(
                        color: AppColor.yellowColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            AssetsManger.usFlag,
                            width: width * 0.06,
                            height: height * 0.03,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        ClipOval(
                          child: Image.asset(
                            AssetsManger.egFlag,
                            width: width * 0.06,
                            height: height * 0.03,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
