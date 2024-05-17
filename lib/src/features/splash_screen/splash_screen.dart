import 'dart:async';

import 'package:e_shop/resources/constant/app_assets.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  void nextScreen() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(() => const AuthService());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyle.height(context),
      width: AppStyle.width(context),
      color: AppStyle.white,
      child: Image.asset(
        AppAssets.splashImage,
      ),
    );
  }
}
