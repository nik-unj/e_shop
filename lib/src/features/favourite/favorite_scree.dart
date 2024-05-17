import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/features/favourite/controller/favorite_controller.dart';
import 'package:e_shop/src/features/product/widget/product_tile_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primary,
        centerTitle: true,
        title: Text(
          AppString.favorite,
          style: AppStyle.headingOrange().copyWith(color: AppStyle.white),
        ),
      ),
      backgroundColor: AppStyle.background,
      body: Obx(() {
        if (favoriteController.favoriteProducts.isEmpty) {
          return Center(
            child: Text(
              AppString.noProduct,
              style: AppStyle.headingOrange(),
            ),
          );
        } else {
          return productsListWidget(
              context, favoriteController.favoriteProducts);
        }
      }),
    );
  }

  Widget productsListWidget(BuildContext context, List list) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              AppStyle.width(context) / AppStyle.height(context) * 1.1,
        ),
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductTileGrid(
            product: list[index],
          );
        },
      ),
    );
  }
}
