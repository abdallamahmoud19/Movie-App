
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';
import '../models/user_model.dart';

class ApiService {
  Future<http.Response> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    return response;
  }
}
