import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/search_bar.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:e_shop/src/features/product/product_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final productController = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        backgroundColor: AppStyle.primary,
        title: SearchBarField(
          controller: homeController.searchController,
          navigateToProductScreen: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: GridView.builder(
          itemCount: AppConstant.categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio:
                AppStyle.width(context) / AppStyle.height(context) * 1.8,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: AppStyle.smallEdgeInsets,
              child: GestureDetector(
                onTap: () {
                  String url = AppConstant.categoryList[index]['url'];
                  productController.getProductsByCategory(url);
                  Get.to(() => const ProductScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppStyle.background,
                    boxShadow: [
                      BoxShadow(
                        color: AppStyle.grey,
                        blurRadius: 5,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: AppStyle.verysmallEdgeInsets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppConstant.categoryList[index]['name'],
                          style:
                              AppStyle.normalHeading().copyWith(fontSize: 20),
                        ),
                        Expanded(
                          child: Padding(
                            padding: AppStyle.smallEdgeInsets,
                            child: Image.asset(
                              AppConstant.categoryList[index]['imageUrl'],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
