import 'package:e_shop/resources/utils/custom_appbar.dart';
import 'package:e_shop/resources/utils/search_bar.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/home/widget/product_tile_grid.dart';
import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final productController = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: customAppBar(
        SearchBarField(
          controller: homeController.searchController,
        ),
      ),
      body: Obx(
        () {
          if (productController.productFormzStatus.value.isInProgress) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) => ProductTileGrid(
                product: productController.productList[index],
              ),
            );
          }
        },
      ),
    );
  }
}
