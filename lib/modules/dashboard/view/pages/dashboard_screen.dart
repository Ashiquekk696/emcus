import 'package:emcus/theme/app_colors.dart';
import 'package:emcus/theme/theme.dart';
import 'package:emcus/utils/sizedbox_util.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16083D),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.darkBlue, AppColors.lightGreen],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              150.0.h,
              Text(
                "SIGNAL STRENGTH",
                style: AppTextStyle.body.copyWith(color: AppColors.white),
                //style:
                //GoogleFonts.poppins(color: Colors.white70)
              ),
              const SizedBox(height: 10),
              Text(
                "95%",
                style: AppTextStyle.veryLarge,
                //GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)
              ),
              10.0.h,
              Container(
                height: 85,
                width: 250,
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GOOD",
                      style: AppTextStyle.veryLarge.copyWith(
                        fontSize: 35,
                        color: AppColors.specialGreen,
                      ),
                      //style:
                      //  GoogleFonts.poppins(color: Color(0xFFB6E526), fontWeight: FontWeight.bold)
                    ),
                    15.0.w,
                    Center(
                      child: Icon(
                        Icons.check_circle,
                        size: 35,
                        color: AppColors.specialGreen,
                      ),
                    ),
                  ],
                ),
              ),
              20.0.h,
              Expanded(
                child: Image.asset(
                  "assets/images/pattern.png",
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
