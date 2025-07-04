import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixText,
    required this.controller,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? prefixText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFCBD5E1), // Light border
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A0F172A), // #0F172A at 10% opacity
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),

        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixText: prefixText,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
