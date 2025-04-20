import 'package:emcus/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ***
/// Typography:
/// FIGMA: https://www.figma.com/file/oN22ZfTyLZ1KTMVuEGuuXa/Sliver-Oaks-%2F-Internal-%2F-%E2%9D%96-Design-System?type=design&node-id=1202-279&mode=design&t=IyN5srCPBtYK2EeO-4
/// ***
class AppTextStyle {
  const AppTextStyle._();

  static const bodySmall400Var1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17.67,
    height: 25.24 / 17.67,
    color: AppColors.black,
  );

  static const heading = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 25,
    color: AppColors.black,
    letterSpacing: 1.5,
  );
  static const heading700 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17.67,
      height: 60.59 / 17.67,
      color: AppColors.black,
      letterSpacing: 1.2);

  // static const body600 = TextStyle(
  //   fontWeight: FontWeight.w600,
  //   fontSize: 20.2,
  //   height: 30.29 / 20.2,
  //   color: AppColors.black,
  // );
  static const body = TextStyle(
    fontSize: 18,
    color: AppColors.black,
  );

  static const veryLarge = TextStyle(
      fontSize: 70, color: AppColors.white, fontWeight: FontWeight.bold);

  static const smallBody = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );
  static const smallBody2 = TextStyle(
    fontSize: 23,
    color: AppColors.white,
  );
  static const largeTitle = TextStyle(
      fontSize: 40,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontFamily: 'Segoe');
}
