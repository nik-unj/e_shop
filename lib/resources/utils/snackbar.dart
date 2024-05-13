import 'package:e_shop/resources/constant/app_style.dart';
import 'package:flutter/material.dart';

class CustomBar {
  static void showCustomSnackBar(String message, BuildContext context,
      {Color color = Colors.green}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: AppStyle.white),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
