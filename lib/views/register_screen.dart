import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_viewmodel.dart';
import '../models/user_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../utils/assets_manger.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: MediaQuery.of(context).size.height * 0.07,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AssetsManger.registerImage,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Name Field
                  CustomTextFiled(
                    controller: nameController,
                    hintText: 'Name',
                    style: AppStyle.regular16White,
                    prefixIcon: Image.asset(AssetsManger.nameIcon),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Email Field
                  CustomTextFiled(
                    controller: emailController,
                    hintText: 'Email',
                    style: AppStyle.regular16White,
                    prefixIcon: Image.asset(AssetsManger.emailIcon),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Password Field
                  CustomTextFiled(
                    controller: passwordController,
                    hintText: 'Password',
                    style: AppStyle.regular16White,
                    obscureText: true,
                    suffixIcon: Image.asset(AssetsManger.showPassIcon),
                    prefixIcon: Image.asset(AssetsManger.passIcon),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Confirm Password Field
                  CustomTextFiled(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    style: AppStyle.regular16White,
                    obscureText: true,
                    suffixIcon: Image.asset(AssetsManger.showPassIcon),
                    prefixIcon: Image.asset(AssetsManger.passIcon),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Phone Field
                  CustomTextFiled(
                    controller: phoneController,
                    hintText: 'Phone Number',
                    style: AppStyle.regular16White,
                    prefixIcon: Image.asset(AssetsManger.phoneIcon),
                  ),

                  // Error Message (if exists)
                  if (viewModel.errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        viewModel.errorMessage,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Register Button
                  CustomElevatedButton(
                    text: viewModel.isLoading ? 'Creating Account...' : 'Create Account',
                    textStyle: AppStyle.regular20Black,
                    onButtonClicked: viewModel.isLoading
                        ? () {} // Assign an empty function instead of null
                        : () {
                      if (passwordController.text != confirmPasswordController.text) {
                        viewModel.setErrorMessage('Passwords do not match.');
                      } else {
                        final user = UserModel(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        );
                        viewModel.registerUser(user, context);
                      }
                    },
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Navigate to Login Screen
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('login_screen');
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already Have an Account? ',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
