import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../utils/assets_manger.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed.dart';
import '../home_screen/home_screen.dart';
import '../login/login_screen.dart';
import '../update_profile/update_profile_screen.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String errorMessage = '';

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
          'Register',
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
              Image.asset(AssetsManger.registerImage, height: height * 0.20),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                controller: nameController,
                hintText: 'Name',
                style: AppStyle.regular16White,
                prefixIcon: Image.asset(AssetsManger.nameIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                controller: emailController,
                hintText: 'Email',
                style: AppStyle.regular16White,
                prefixIcon: Image.asset(AssetsManger.emailIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                controller: passwordController,
                hintText: 'Password',
                style: AppStyle.regular16White,
                obscureText: true,
                suffixIcon: Image.asset(AssetsManger.showPassIcon),
                prefixIcon: Image.asset(AssetsManger.passIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                style: AppStyle.regular16White,
                obscureText: true,
                suffixIcon: Image.asset(AssetsManger.showPassIcon),
                prefixIcon: Image.asset(AssetsManger.passIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFiled(
                controller: phoneController,
                hintText: 'Phone Number',
                style: AppStyle.regular16White,
                prefixIcon: Image.asset(AssetsManger.phoneIcon),
              ),
              // Display error message if there is any
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                text: 'Create Account',
                textStyle: AppStyle.regular20Black,
                onButtonClicked: () {
                  setState(() {
                    errorMessage = '';

                    // Validate inputs
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty ||
                        phoneController.text.isEmpty) {
                      errorMessage = 'All fields are required.';
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      errorMessage = 'Passwords do not match.';
                    } else {
                      Navigator.of(context).pushNamed(
                        UpdateProfileScreen.routeName,
                        arguments: {
                          'name': nameController.text,
                          'phone': phoneController.text,
                        },
                      );
                    }
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already Have Account ? ',
                        style: AppStyle.regular16White,
                      ),
                      TextSpan(
                        text: 'Login ',
                        style: AppStyle.regular14Yellow,
                      ),
                    ],
                  ),
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
