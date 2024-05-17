// ignore_for_file: must_be_immutable

import 'package:e_shop/resources/constant/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  void Function()? onTap;
  double? width;
  Color? color;
  CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? AppStyle.width(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color ?? AppStyle.secondary,
          ),
          child: Padding(
            padding: AppStyle.smallEdgeInsets,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyle.normalHeading().copyWith(
                color: AppStyle.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
