import 'dart:convert';

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/status_card.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallsDataScreenWidget extends StatefulWidget {
  const CallsDataScreenWidget({super.key});

  @override
  State<CallsDataScreenWidget> createState() => _CallsDataScreenWidgetState();
}

class _CallsDataScreenWidgetState extends State<CallsDataScreenWidget> {
  String? userName;
  String? testListLength;
  int pendingCalls = 0;
  int doneCalls = 0;
  int scheduleCalls = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    userName = prefs.getString('username');

    try {
      // 1. GET /api/list?userId=xxx
      final listRes = await http.get(
        Uri.parse('https://mock-api.calleyacd.com/api/list?userId=$userId'),
      );

      if (listRes.statusCode == 200) {
        final listData = jsonDecode(listRes.body);
        final listId = listData['_id'];

        // 2. GET /api/list/{listId}
        final detailsRes = await http.get(
          Uri.parse('https://mock-api.calleyacd.com/api/list/$listId'),
        );

        if (detailsRes.statusCode == 200) {
          final details = jsonDecode(detailsRes.body);
          setState(() {
            pendingCalls = details['pending'];
            doneCalls = details['called'];
            scheduleCalls = details['rescheduled'];
            testListLength = (details['calls'] as List).length.toString();
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryContainer,
                  border: Border.all(color: AppColors.primaryBorderColor),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 22,
                    right: 24,
                    bottom: 22,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Test List",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "$testListLength",
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'CALLS',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 3,
                                    // color: AppColors.primaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryBlue,
                        ),
                        child: Center(
                          child: Text(
                            userName![0],
                            style: TextStyle(
                              color: AppColors.primaryContainer,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Pie Chart Section
              Expanded(
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: 150,
                    sectionsSpace: 8,
                    centerSpaceRadius: 70,
                    borderData: FlBorderData(show: false),
                    sections: [
                      PieChartSectionData(
                        color: Color(0xffFAAB3C),
                        value: 22, // 22/50 * 100
                        title: '',
                        radius: 30,
                        borderSide: BorderSide.none,
                      ),
                      PieChartSectionData(
                        color: Color(0xff1F74EC),
                        value: 28, // 28/50 * 100
                        title: '',
                        radius: 30,
                      ),
                      PieChartSectionData(
                        color: Color(0xff9566F2),
                        value: 9, // 9/50 * 100
                        title: '',
                        radius: 40,
                      ),
                    ],
                  ),
                ),
              ),

              // Status Cards
              Row(
                children: [
                  StatusCard(
                    backgroundColor: Color(0xffFEF0DB),
                    barColor: Color(0xffFAAB3C),
                    statusData: pendingCalls.toString(),
                    statusName: "Pending",
                  ),
                  SizedBox(width: 10),
                  StatusCard(
                    backgroundColor: Color(0xffDDFCE0),
                    barColor: Color(0xff0EB01D),
                    statusData: doneCalls.toString(),
                    statusName: "Done",
                  ),

                  SizedBox(width: 10),
                  StatusCard(
                    backgroundColor: Color(0xffF3EEFE),
                    barColor: Color(0xff4E1BD9),
                    statusData: scheduleCalls.toString(),
                    statusName: "Schedule",
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlueButton(
                buttonName: "Start Calling Now",
                onPressedButton: () {},
                padding: 0,
              ),
              SizedBox(height: 10),
            ],
          ),
        );
  }
}
