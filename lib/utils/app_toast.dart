import 'package:emcus/theme/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

/// Shows a toast with a custom message and optional styling.
void showCustomToast(
  String message, {
  ToastGravity gravity = ToastGravity.BOTTOM,
  Color backgroundColor = AppColors.primaryColor,
  Color textColor = Colors.white,
  double fontSize = 16.0,
  Toast toastLength = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: message.replaceAll("Exception:", ""),
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
  );
}
