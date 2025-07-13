import 'dart:convert';

import 'package:calley/Widgets/custom_navigation_bar.dart';
import 'package:calley/Widgets/the_drawer.dart';
import 'package:calley/pages/calling_screen_widget.dart';
import 'package:calley/pages/calls_data_screen_widget.dart';
import 'package:calley/pages/dummy_calender.dart';
import 'package:calley/pages/dummy_profiles.dart';
import 'package:calley/pages/intro_screen.dart';
import 'package:calley/services/api_services.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.userEmail,
    required this.userId,
    required this.userName,
  });

  final String userName;
  final String userId;
  final String userEmail;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? fetchedId;
  String? fetchedName;
  List<dynamic>? fetchedAgents;
  bool isLoading = true;
  void _LoadData() async {
    try {
      final response = await ApiService.getList(userid: widget.userId);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          fetchedName = data["name"];
          fetchedId = data["_id"];
          fetchedAgents = data["agents"];
          isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong: $e")));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _LoadData();
  }

  // final userName = widget.userName;
  int _selectedScreenIndex = 2;

  void _ontabSelected(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }
    final _screens = [
      CallingScreen(userName: widget.userName),
      DummyProfiles(),
      IntroScreen(
        userName: widget.userName,
        onStartCallingTaped: (index) {
          _ontabSelected(index);
        },
      ),
      CallsDataScreenWidget(
        userEmailId: widget.userEmail,
        userName: widget.userName,
        id: fetchedId!,
      ), // i want to use te id i should be getting from getlist just above
      DummyCalender(),
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      drawer: TheDrawer(
        userEmailId: widget.userEmail,
        userName: widget.userName,
      ),
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
