import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    this.onTaped,
    required this.currentIndex,
  });
  final Function(int)? onTaped;
  final int currentIndex;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(color: AppColors.primaryBlue, width: 1.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/images/home_tab.png",
                color: widget.currentIndex == 0 ? Colors.blue : Colors.black,
              ),
            ),
            index: 0,
            isSelected: widget.currentIndex == 0,
          ),
          _buildNavItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                "assets/images/name_card_tab.png",
                color: widget.currentIndex == 1 ? Colors.blue : Colors.black,
              ),
            ),
            index: 1,
            isSelected: widget.currentIndex == 1,
          ),
          _buildMidNavItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 25),
              height: 54,
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryBlue,
              ),
              child: Image.asset(
                "assets/images/play_tab.png",
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
            index: 2,
            isSelected: widget.currentIndex == 2,
          ),
          _buildNavItem(
            icon: SizedBox(
              height: 23,
              width: 23,
              child: Image.asset(
                "assets/images/logs_tab.png",
                color: widget.currentIndex == 3 ? Colors.blue : Colors.black,
              ),
            ),
            index: 3,
            isSelected: widget.currentIndex == 3,
          ),
          _buildNavItem(
            icon: SizedBox(
              height: 22,
              width: 22,
              child: Image.asset(
                "assets/images/dnt_tab.png",
                color: widget.currentIndex == 4 ? Colors.blue : Colors.black,
              ),
            ),
            index: 4,
            isSelected: widget.currentIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required Widget icon,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => widget.onTaped?.call(index),
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: Duration(milliseconds: 100),
        child: Container(
          color: Colors.transparent,
          height: 80,
          width: 80,
          padding: EdgeInsets.all(27),
          child: icon,
        ),
      ),
    );
  }

  Widget _buildMidNavItem({
    required Widget icon,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => widget.onTaped?.call(index),
      child: AnimatedScale(
        scale: isSelected ? 1.05 : 1.0,
        duration: Duration(milliseconds: 100),
        child: icon,
      ),
    );
  }
}
