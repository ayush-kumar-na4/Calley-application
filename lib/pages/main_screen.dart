import 'package:calley/Widgets/custom_navigation_bar.dart';
import 'package:calley/Widgets/the_drawer.dart';
import 'package:calley/pages/calling_screen_widget.dart';
import 'package:calley/pages/calls_data_screen_widget.dart';
import 'package:calley/pages/dummy_calender.dart';
import 'package:calley/pages/dummy_profiles.dart';
import 'package:calley/pages/intro_screen.dart';
import 'package:calley/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 2;
  final List<Widget> _screens = [
    CallingScreen(),

    DummyProfiles(),
    IntroScreen(),
    CallsDataScreenWidget(),
    DummyCalender(),
  ];
  void _ontabSelected(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      drawer: TheDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleSpacing: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/images/call_support.png",
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 22),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/images/notification.png",
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTaped: (index) {
          _ontabSelected(index);
        },
      ),
      body: _screens[_selectedScreenIndex],
    );
  }
}
