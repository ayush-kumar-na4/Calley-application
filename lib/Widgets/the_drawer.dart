
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class TheDrawer extends StatefulWidget {
  const TheDrawer({
    super.key,
    required this.userEmailId,
    required this.userName,
  });
  final String userName;
  final String userEmailId;

  @override
  State<TheDrawer> createState() => _TheDrawerState();
}



class _TheDrawerState extends State<TheDrawer> {
  Widget _buildDrawerListTile({
    // required VoidCallback onTap,
    required String title,
    required Widget logo,
    required VoidCallback ontap,
  }) {
    return ListTile(
      onTap: ontap,
      minVerticalPadding: 25,
      title: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      leading: Container(
        padding: EdgeInsets.all(10),
        height: 41,
        width: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryContainer,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A0F172A),
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: logo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                color: AppColors.primaryBlue,
              ),
              child: Row(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.userName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryContainer,
                                ),
                              ),

                              TextSpan(
                                text: '  •  Personal',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFC778),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.userEmailId,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 512,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                border: Border(
                  left: BorderSide(
                    color: AppColors.primaryBorderColor,
                    width: 1.2,
                  ),
                  right: BorderSide(
                    color: AppColors.primaryBorderColor,
                    width: 1.2,
                  ),
                  bottom: BorderSide(
                    color: AppColors.primaryBorderColor,
                    width: 1.2,
                  ),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.only(left: 8, top: 6),
                children: [
                  //Getting Started
                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Getting Started",
                    logo: Image.asset("assets/images/getting_started.png"),
                  ),

                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Sync Data",
                    logo: Image.asset("assets/images/sync_data.png"),
                  ),

                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Gamification",
                    logo: Image.asset("assets/images/gamification.png"),
                  ),

                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Send Logs",
                    logo: Image.asset("assets/images/send_logs.png"),
                  ),
                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Settings",
                    logo: Image.asset("assets/images/settings.png"),
                  ),
                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Help?",
                    logo: Image.asset("assets/images/help.png"),
                  ),
                  _buildDrawerListTile(
                    ontap: () {},
                    title: "Cancel Subscription",
                    logo: Image.asset("assets/images/cancel_subscription.png"),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                // height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: AppColors.primaryBorderColor,
                      width: 1.2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          bottom: 10,
                        ),
                        child: Text(
                          'App Info',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildDrawerListTile(
                              ontap: () {},
                              title: "About Us",
                              logo: Image.asset("assets/images/about_us.png"),
                            ),
                            _buildDrawerListTile(
                              ontap: () {},
                              title: "Privacy Policy",
                              logo: Image.asset("assets/images/about_us.png"),
                            ),
                            _buildDrawerListTile(
                              ontap: () {},
                              title: "Version 1.01.52",
                              logo: Image.asset("assets/images/version.png"),
                            ),
                            _buildDrawerListTile(
                              ontap: () {},
                              title: "Logout",
                              logo: Image.asset("assets/images/logout.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
