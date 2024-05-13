// ignore_for_file: must_be_immutable

import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:e_shop/src/features/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  bool? navigateToProductScreen;
  SearchBarField({
    super.key,
    required this.controller,
    this.navigateToProductScreen,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
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
          contentPadding: const EdgeInsets.only(top: 10),
          fillColor: AppStyle.white.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: AppStyle.white,
          hintText: "Search Eshop",
          hintStyle: AppStyle.textFieldStyle(),
        ),
        style: AppStyle.textFieldStyle(),
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppStyle.white,
        onSubmitted: (value) {
          productController.getProductsBySearch(value);
          navigateToProductScreen ?? false
              ? Get.to(() => const ProductScreen())
              : null;
        },
      ),
    );
  }
}
