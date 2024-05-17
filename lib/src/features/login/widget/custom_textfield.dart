// ignore_for_file: must_be_immutable

import 'package:e_shop/resources/constant/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  bool? showPassword;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.showPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: !(showPassword ?? true),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppStyle.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppStyle.white,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        fillColor: AppStyle.white.withOpacity(0.2),
        filled: true,
        hintText: hintText,
        hintStyle: AppStyle.textFieldStyle().copyWith(color: AppStyle.white),
      ),
      style: AppStyle.textFieldStyle().copyWith(color: AppStyle.white),
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppStyle.white,
    );
  }
}
