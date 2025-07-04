import 'dart:convert';

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/custom_text_field.dart';
import 'package:calley/Widgets/reusable_register_or_login_page.dart';
import 'package:calley/pages/sign_in_page.dart';
import 'package:calley/pages/whatsaap_otp_page.dart';
import 'package:calley/services/api_services.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreeToTerms = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusableRegisterOrLoginPage(
      child: Column(
        children: [
          SizedBox(height: 45),
          Text(
            "Welcome!",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 11),
          Text(
            "Please register to continue",
            style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 15),
          ),
          SizedBox(height: 28),
          CustomTextField(
            controller: nameController,
            hintText: "Name",
            suffixIcon: Image.asset("assets/images/name_icon.png"),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email address",
            suffixIcon: Image.asset("assets/images/Email_address_icon.png"),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: passWordController,
            hintText: "Password",
            obscureText: true,
            suffixIcon: Image.asset("assets/images/password_Icon.png"),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: phoneController,
            prefixIcon: Container(
              padding: EdgeInsets.only(left: 16, right: 5),
              height: 20,
              width: 20,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                child: Image.asset("assets/images/indian_flag.png"),
              ),
            ),
            keyboardType: TextInputType.phone,
            hintText: "+91",
            suffixIcon: Image.asset("assets/images/phone_number_icon.png"),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: mobileNumberController,
            hintText: "Mobile number",
            suffixIcon: Image.asset("assets/images/mobile_number_icon.png"),
          ),
          SizedBox(height: 22),

          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value ?? false;
                      });
                    },
                    activeColor: Color(0xFF4285F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "I agree to the ",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle sign in navigation
                  },
                  child: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  "Sign In",
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
          BlueButton(
            buttonName: "Sign up",
            onPressedButton: () async {
              if (!agreeToTerms) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please agree to Terms and Conditions."),
                  ),
                );
                return;
              }

              final username = nameController.text.trim();
              final email = emailController.text.trim();
              final password = passWordController.text.trim();

              if (username.isEmpty || email.isEmpty || password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please fill all required fields")),
                );
                return;
              }

              try {
                final response = await ApiService.registerUser(
                  username: username,
                  email: email,
                  password: password,
                );

                if (response.statusCode == 200 || response.statusCode == 201) {
                  final messageRecieved =
                      jsonDecode(response.body)['message'] ?? "User Registered";
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(messageRecieved)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                } else {
                  final error =
                      jsonDecode(response.body)['message'] ??
                      'Registration failed';
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(error)));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Something went wrong: $e")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
