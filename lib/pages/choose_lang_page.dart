

import 'package:calley/Widgets/blue_button.dart';
import 'package:calley/pages/register_page.dart';
import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChooseLangpage extends StatefulWidget {
  const ChooseLangpage({super.key});

  @override
  State<ChooseLangpage> createState() => _ChooseLangpageState();
}

class _ChooseLangpageState extends State<ChooseLangpage> {
  String choosedLanguage = 'English';
  final List<Map<String, String>> languages = [
    {'name': 'English', 'greeting': 'Hi'},
    {'name': 'Hindi', 'greeting': 'नमस्ते'},
    {'name': 'Bengali', 'greeting': 'হ্যালো'},
    {'name': 'Kannada', 'greeting': 'ನಮಸ್ಕಾರ'},
    {'name': 'Punjabi', 'greeting': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'name': 'Tamil', 'greeting': 'வணக்கம்'},
    {'name': 'Telugu', 'greeting': 'హలో'},
    {'name': 'French', 'greeting': 'Bonjour'},
    {'name': 'Spanish', 'greeting': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Choose Your Language',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 70),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 735,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primaryBorderColor,
                  width: 1,
                ),
                boxShadow: [BoxShadow(blurRadius: 2)],
              ),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      choosedLanguage == languages[index]['name'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        choosedLanguage = languages[index]['name']!;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                languages[index]['name']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                languages[index]['greeting']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(4),
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.black),
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            child:
                                isSelected
                                    ? Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: Colors.white,
                                    )
                                    : null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ),

            Spacer(),
            BlueButton(
              padding: 0,
              buttonName: "Select",
              onPressedButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
