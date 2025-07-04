import 'dart:convert';

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/custom_text_field.dart';
import 'package:calley/Widgets/reusable_register_or_login_page.dart';
import 'package:calley/pages/main_screen.dart';
import 'package:calley/services/api_services.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await ApiService.loginUser(
        email: email,
        password: password,
      );

      setState(() => isLoading = false);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final username = data['user']['username'];
        final email = data['user']['email'];
        final userId = data['user']['_id'];
        // Store in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);
        await prefs.setString('email', email);
        await prefs.setString('userId', userId);

        // Optionally store this info in SharedPreferences for later

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Login failed';
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReusableRegisterOrLoginPage(
      child: Column(
        children: [
          SizedBox(height: 138),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 11),
          Text(
            "Please sign-in to continue",
            style: TextStyle(
              fontSize: 15.5,
              color: AppColors.secondaryTextColor,
            ),
          ),
          SizedBox(height: 22),
          CustomTextField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Email address",
            controller: emailController,
            suffixIcon: Image.asset("assets/images/Email_address_icon.png"),
          ),
          SizedBox(height: 30),
          CustomTextField(
            obscureText: true,
            hintText: "Password",
            controller: passwordController,
            suffixIcon: Image.asset("assets/images/password_Icon.png"),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Text("Forgot Password?"),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't have an account?", style: TextStyle(fontSize: 15)),
              GestureDetector(
                onTap: () {}, // navigate to sign-up
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          isLoading
              ? CircularProgressIndicator(padding: EdgeInsets.all(10))
              : BlueButton(
                buttonName: "Sign In",
                onPressedButton: _handleLogin,
              ),
        ],
      ),
    );
  }
}
