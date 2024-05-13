import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar(Widget? child) {
  final homeController = Get.find<HomeController>();
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: AppStyle.primary,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppStyle.white,
      ),
      onPressed: () {
        homeController.searchController.clear();
        Get.back();
      },
    ),
    title: child,
  );
}
