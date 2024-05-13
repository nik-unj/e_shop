import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:e_shop/src/features/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:get/get.dart';

class CategoryIcon extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String url;
  const CategoryIcon(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final productController = Get.find<ProductController>();
    return GestureDetector(
      onTap: () {
        productController.getProductsByCategory(url);
        Get.to(() => const ProductScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppStyle.grey,
                    blurRadius: 5,
                    spreadRadius: 0.8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Image.asset(
                  imageUrl,
                  height: height * 0.04,
                  width: height * 0.04,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                name,
                style: AppStyle.normalText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
