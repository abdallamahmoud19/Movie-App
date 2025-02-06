import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_manger.dart';

class AvatarSelectionScreen extends StatefulWidget {
  @override
  _AvatarSelectionScreenState createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
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

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.blackColor,
      isScrollControlled: true,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
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
          style: TextStyle(color: AppColor.whiteColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick Avatar',
              style: TextStyle(
                color: AppColor.yellowColor,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _showAvatarPicker,
              child: Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
