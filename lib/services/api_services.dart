import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String calleyBaseUrl = "https://mock-api.calleyacd.com/api";

  static Future<http.Response> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$calleyBaseUrl/auth/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    return response;
  }

  static Future<http.Response> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$calleyBaseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    return response;
  }
}
