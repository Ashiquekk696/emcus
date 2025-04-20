import 'package:flutter/material.dart';
import 'package:emcus/routes.dart';
import 'package:emcus/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to login after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            // Right side background
            Positioned.fill(
              child: Container(
                color: AppColors.red,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned.fill(
              left: 130,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.30),
                      offset: const Offset(-8, 0),
                      blurRadius: 33,
                      spreadRadius: 100,
                    ),
                  ],
                ),
                child: Image.asset("assets/images/emcus.png"),
              ),
            ),

            // Left panel
            Positioned(
              left: 0,
              top: 220,
              child: Image.asset("assets/images/earPhone.png"),
            ),
          ],
        ),
      ),
    );
  }
}
