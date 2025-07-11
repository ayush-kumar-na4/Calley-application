import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.buttonName,
    required this.onPressedButton,
    this.height = 56,
    this.widget = double.infinity,
    this.padding = 20,
  });

  final String buttonName;
  final void Function() onPressedButton;
  final double height;
  final double? widget;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: height,
        width: widget,
        child: ElevatedButton(
          onPressed: onPressedButton,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
