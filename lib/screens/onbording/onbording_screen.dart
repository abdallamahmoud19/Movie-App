import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  String selectedButton = "next";

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            imagePath: 'assets/images/image1.png',
            title: 'Find Your Next Favorite Movie Here',
            description:
            'Get access to a huge library of movies to suit all tastes. You will surely like it.',
            buttonText: 'Explore Now',
            onPressed: _nextPage,
            showGradient: true,
            isBlackBox: false,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
            backButton: false,
          ),
          OnboardingPage(
            imagePath: 'assets/images/image2.png',
            title: 'Discover Movies',
            description:
            'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
            buttonText: 'Next',
            onPressed: _nextPage,
            showGradient: false,
            isBlackBox: true,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
            backButton: false,
          ),
          OnboardingPage(
            imagePath: 'assets/images/image3.png',
            title: 'Explore All Genres',
            description:
            'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
            buttonText: 'Next',
            backButton: true,
            onPressed: _nextPage,
            onBackPressed: _previousPage,
            showGradient: false,
            isBlackBox: true,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
          ),
          OnboardingPage(
            imagePath: 'assets/images/image4.png',
            title: 'Create Watchlists',
            description:
            'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
            buttonText: 'Next',
            backButton: true,
            onPressed: _nextPage,
            onBackPressed: _previousPage,
            showGradient: false,
            isBlackBox: true,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
          ),
          OnboardingPage(
            imagePath: 'assets/images/image5.png',
            title: 'Rate, Review, and Learn',
            description:
            'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.',
            buttonText: 'Next',
            backButton: true,
            onPressed: _nextPage,
            onBackPressed: _previousPage,
            showGradient: false,
            isBlackBox: true,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
          ),
          OnboardingPage(
            imagePath: 'assets/images/image6.png',
            title: 'Start Watching Now',
            description: '',
            buttonText: 'Finish',
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            backButton: true,
            onBackPressed: _previousPage,
            showGradient: false,
            isBlackBox: true,
            selectedButton: selectedButton,
            onSelectButton: (button) {
              setState(() {
                selectedButton = button;
              });
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onPressed;
  final VoidCallback? onBackPressed;
  final bool backButton;
  final bool showGradient;
  final bool isBlackBox;
  final String? selectedButton;
  final ValueChanged<String>? onSelectButton;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onPressed,
    this.onBackPressed,
    this.backButton = false,
    this.showGradient = false,
    this.isBlackBox = true,
    this.selectedButton,
    this.onSelectButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 430 / 680,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        if (showGradient)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(1.0),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        Positioned(
          bottom: -30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: isBlackBox ? Color(0xFF121312) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isBlackBox ? 40 : 0),
                topRight: Radius.circular(isBlackBox ? 40 : 0),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x99FFFFFF),
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 26),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildButton(
                      text: buttonText,
                      isSelected: selectedButton == "next",
                      onPressed: () {
                        if (onSelectButton != null) onSelectButton!("next");
                        if (onPressed != null) onPressed!();
                      },
                    ),
                    SizedBox(height: 10),
                    if (backButton && onBackPressed != null)
                      _buildButton(
                        text: "Back",
                        isSelected: selectedButton == "back",
                        onPressed: () {
                          if (onSelectButton != null) onSelectButton!("back");
                          if (onBackPressed != null) onBackPressed!();
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFFF6BD00) : Color(0xFF121312),
        foregroundColor: isSelected ? Color(0xFF121312) : Color(0xFFF6BD00),
        side: BorderSide(color: Color(0xFFF6BD00), width: 2),
        minimumSize: Size(398, 55),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}