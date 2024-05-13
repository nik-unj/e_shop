import 'package:e_shop/resources/constant/app_style.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      body: Center(
        child: Text(
          "No items in favorite",
          style: AppStyle.headingOrange(),
        ),
      ),
    );
  }
}
