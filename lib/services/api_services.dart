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

  static Future<http.Response> sendOTP({required String email}) async {
    final url = Uri.parse('$calleyBaseUrl/auth/send-otp');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );
    return response;
  }

  static Future<http.Response> verifyOTP({
    required String email,
    required String otp,
  }) async {
    final url = Uri.parse('$calleyBaseUrl/auth/verify-otp');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "otp": otp}),
    );
    return response;
  }

  static Future<http.Response> getList({required String userid}) async {
    final url = Uri.parse('$calleyBaseUrl/list?userId=$userid');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    return response;
  }

  static Future<http.Response> getListDetails({required String userid}) async {
    final url = Uri.parse('$calleyBaseUrl/list/$userid');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    return response;
  }
}
