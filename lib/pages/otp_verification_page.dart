import 'dart:convert';

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/reusable_register_or_login_page.dart';
import 'package:calley/pages/sign_in_page.dart';
import 'package:calley/services/api_services.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifiationPage extends StatefulWidget {
  const OtpVerifiationPage({super.key, required this.registeredEmail});

  final String registeredEmail;

  @override
  State<OtpVerifiationPage> createState() => _OtpVerifiationPageState();
}

class _OtpVerifiationPageState extends State<OtpVerifiationPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    return ReusableRegisterOrLoginPage(
      child: Column(
        children: [
          SizedBox(height: 110),
          Text(
            "Email \n Verification",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Please ensure that the email id mentioned is valid\n as we have sent an OTP to your email.",
            style: TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: PinCodeTextField(
              controller: otpController,
              appContext: context,
              length: 6,
              onChanged: (value) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 55,
                fieldWidth: 55,
                inactiveColor: Colors.grey.shade300,
                selectedColor: AppColors.primaryBlue,
                activeColor: AppColors.primaryBlue,
              ),
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              cursorColor: AppColors.primaryBlue,
              animationType: AnimationType.scale,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${widget.registeredEmail} ?',
            style: TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive OTP code? ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () async {
                  final email = widget.registeredEmail.trim();

                  try {
                    final response = await ApiService.sendOTP(email: email);
                    if (response.statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("OTP Resent Sucessfully"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Something went wrong: $e")),
                    );
                  }
                },

                child: Text(
                  " Resend OTP",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          BlueButton(
            buttonName: "Verify",
            onPressedButton: () async {
              final otp = otpController.text.trim();
              final email = widget.registeredEmail.trim();
              try {
                final response = await ApiService.verifyOTP(
                  email: email,
                  otp: otp,
                );
                if (response.statusCode == 200) {
                  final String messageRecieved =
                      jsonDecode(response.body)["message"] ??
                      "OTP Verified Successfully";
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(messageRecieved)));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Something went wrong: $e")),
                );
              }
            },
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
