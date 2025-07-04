import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        border: Border(
          top: BorderSide(color: AppColors.primaryBorderColor, width: 1.2),
          right: BorderSide(color: AppColors.primaryBorderColor, width: 1.2),
          left: BorderSide(color: AppColors.primaryBorderColor, width: 1.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: child,
    );
  }
}
