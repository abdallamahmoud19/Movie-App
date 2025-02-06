import 'package:flutter/material.dart';
import 'package:untitled7/utils/assets_manger.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../widget/custom_text_filed.dart';
import '../reset_password_screen/reset_password_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = 'update_profile_screen';

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final List<String> avatars = [
    AssetsManger.gamer1,
    AssetsManger.gamer2,
    AssetsManger.gamer3,
    AssetsManger.gamer4,
    AssetsManger.gamer5,
    AssetsManger.gamer6,
    AssetsManger.gamer7,
    AssetsManger.gamer8,
    AssetsManger.gamer9,
  ];

  String selectedAvatar = AssetsManger.gamer1;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, String>) {
      _nameController.text = arguments['name'] ?? '';
      _phoneController.text = arguments['phone'] ?? '';
    }
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose an Avatar',
                style: TextStyle(
                  color: AppColor.yellowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAvatar = avatars[index];
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedAvatar == avatars[index]
                            ? AppColor.yellowColor
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        avatars[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.yellowColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Update Profile',
          style: AppStyle.regular16Yellow,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(selectedAvatar),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.yellowColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _showAvatarPicker,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.yellowColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColor.blackColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),

            // Name Field
            CustomTextFiled(
              hintText: 'User Name',
              style: AppStyle.regular16White,
              prefixIcon: Image.asset(AssetsManger.userIcon),
              controller: _nameController,
            ),
            SizedBox(height: height * 0.02),

            // Phone Field
            CustomTextFiled(
              hintText: 'Phone Number',
              style: AppStyle.regular16White,
              prefixIcon: Image.asset(AssetsManger.phoneIcon),
              controller: _phoneController,
            ),
            SizedBox(height: height * 0.02),

            // Reset Password Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reset Password',
                    style: AppStyle.regular20White,
                  ),
                ],
              ),
            ),
            Spacer(),

            // Delete Account Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.redColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Logic to delete account
                _showDeleteAccountDialog(context);
              },
              child: Text('Delete Account', style: AppStyle.regular20White),
            ),
            SizedBox(height: height * 0.02),

            // Update Data Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.yellowColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Logic to update data
                final newName = _nameController.text;
                final newPhone = _phoneController.text;
                _updateProfileData(newName, newPhone);
              },
              child: Text('Update Data', style: AppStyle.regular20Black),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Logic to delete account
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Account deleted successfully!')),
                );
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _updateProfileData(String newName, String newPhone) {
    // Logic to update profile data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );
  }
}
