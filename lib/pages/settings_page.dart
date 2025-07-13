import 'package:calley/pages/test_calls_list_page.dart';
import 'package:calley/utils/app_colors.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.userEmailId,
    required this.userName,
    required this.calls,
  });

  final String userName;
  final String userEmailId;
  final List<Map<String, dynamic>> calls;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              // height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryBorderColor),
                color: AppColors.primaryBlue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      child: Image.asset('assets/images/user.png'),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "Hello $userName",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryContainer,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "$userEmailId",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryContainer,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "7562893376",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryContainer,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Parent Account: NA",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryContainer,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Current Subscription: Calley Personal",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 475,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondaryBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  Center(
                    child: Text(
                      "PROFILE SETTINGS",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryContainer,
                      ),
                      // textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(height: 18),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.primaryBorderColor),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightBlue,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryContainer,
                                  ),
                                  child: Icon(Icons.language_sharp, size: 26),
                                ),

                                SizedBox(width: 10),
                                Text(
                                  "App Language",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/images/right-arrow.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightBlue,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryContainer,
                                  ),
                                  child: Icon(
                                    Icons.lock_outline_rounded,
                                    size: 26,
                                  ),
                                ),

                                SizedBox(width: 10),
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/images/right-arrow.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightBlue,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryContainer,
                                  ),
                                  child: Icon(
                                    Icons.add_ic_call_outlined,
                                    size: 26,
                                  ),
                                ),

                                SizedBox(width: 10),
                                Text(
                                  "Calling Lists",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    return _showBottomSheet(context);
                                  },
                                  child: Image.asset(
                                    "assets/images/right-arrow.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder:
          (context) => Container(
            height: 400,
            decoration: BoxDecoration(
              color: AppColors.secondaryBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 18),
                Center(
                  child: Text(
                    "CALLING LISTS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryContainer,
                    ),

                    // textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 18),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(color: AppColors.primaryBorderColor),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 14,
                          ),
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.lightBlue,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Select Calling List",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 110,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryBlue,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.sync_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Refresh",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        TestCallsListPage(calls: calls),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 14,
                            ),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightBlue,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Test List",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/images/right-arrow.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
