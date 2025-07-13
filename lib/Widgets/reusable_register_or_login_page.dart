import 'package:calley/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReusableRegisterOrLoginPage extends StatelessWidget {
  const ReusableRegisterOrLoginPage({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                height: 70,
                width: 240,
                child: Image.asset('assets/images/Logo.png', fit: BoxFit.fill),
              ),
              SizedBox(height: 35),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Container(
                            width: double.infinity,

                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              border: Border(
                                top: BorderSide(
                                  color: AppColors.primaryBorderColor,
                                  width: 1,
                                ),
                                right: BorderSide(
                                  color: AppColors.primaryBorderColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: AppColors.primaryBorderColor,
                                  width: 1,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.containerShadow,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: child,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
