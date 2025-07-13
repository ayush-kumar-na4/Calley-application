import 'dart:convert';

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/Widgets/status_card.dart';
import 'package:calley/pages/settings_page.dart';
import 'package:calley/services/api_services.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CallsDataScreenWidget extends StatefulWidget {
  const CallsDataScreenWidget({
    super.key,
    required this.id,
    required this.userName,
    required this.userEmailId,
  });

  final String id;
  final String userName;
  final String userEmailId;

  @override
  State<CallsDataScreenWidget> createState() => _CallsDataScreenWidgetState();
}

class _CallsDataScreenWidgetState extends State<CallsDataScreenWidget> {
  List<Map<String, dynamic>>? callsList;

  String? callsListLength;
  int? pendingCalls;
  int? doneCalls;
  int? scheduleCalls;
  bool isLoading = true;

  void _LoadData() async {
    try {
      final response = await ApiService.getListDetails(userid: widget.id);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          doneCalls = data["called"];
          scheduleCalls = data["rescheduled"];
          pendingCalls = data["pending"];
          callsList = List<Map<String, dynamic>>.from(data['calls']);
          callsListLength = callsList!.length.toString();
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
    _LoadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("$callsListLength hi this ia ***");
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => SettingsPage(
                            userEmailId: widget.userEmailId,
                            userName: widget.userName,
                            calls: callsList!,
                          ),
                    ),
                  );
                },
                child: Container(
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
                                    "$callsListLength",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "CALLS",
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
                              widget.userName[0],
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
                    statusData: "$pendingCalls",
                    statusName: "Pending",
                  ),
                  SizedBox(width: 10),
                  StatusCard(
                    backgroundColor: Color(0xffDDFCE0),
                    barColor: Color(0xff0EB01D),
                    statusData: "$doneCalls",
                    statusName: "Done",
                  ),

                  SizedBox(width: 10),
                  StatusCard(
                    backgroundColor: Color(0xffF3EEFE),
                    barColor: Color(0xff4E1BD9),
                    statusData: "$scheduleCalls",
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
