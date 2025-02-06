import 'package:flutter/material.dart';
import '../models/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;
  String errorMessage = '';

  void setErrorMessage(String message) {
    errorMessage = message;
    notifyListeners(); // Notify the UI of changes
  }

  Future<void> registerUser(UserModel user, BuildContext context) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      // Simulate API call or Firebase Auth (Replace this with real authentication)
      await Future.delayed(Duration(seconds: 2));

      if (user.email.isEmpty || user.password.isEmpty || user.name.isEmpty) {
        setErrorMessage('All fields are required.');
      } else {
        // Successfully registered
        Navigator.pushNamed(context, 'home_screen'); // Navigate to Home
      }
    } catch (error) {
      setErrorMessage('Registration failed. Please try again.');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
