import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/reusable_register_or_login_page.dart';
import 'package:calley/pages/sign_in_page.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class WhatsaapOtpPage extends StatelessWidget {
  const WhatsaapOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableRegisterOrLoginPage(
      child: Column(
        children: [
          SizedBox(height: 128),
          Text(
            "Whatsapp OTP\n Verification",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18),
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
            ),
          ),
          SizedBox(height: 20),
          Text(
            "+91 7676286822?",
            style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
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
                onTap: () {
                  // Handle sign in navigation
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
            onPressedButton: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
