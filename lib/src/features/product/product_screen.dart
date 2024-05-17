import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/search_bar.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:e_shop/src/features/product/widget/product_tile_grid.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final homeController = Get.find<HomeController>();
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
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
        title: SearchBarField(
          controller: homeController.searchController,
        ),
      ),
      body: Obx(
        () {
          if (productController.productFormzStatus.value.isInProgress) {
            return Skeletonizer(
              child: productsListWidget(true),
            );
          } else {
            if (productController.productList.isEmpty) {
              return Center(
                child: Text(
                  AppString.noProduct,
                  style: AppStyle.headingOrange(),
                ),
              );
            } else {
              return productsListWidget(false);
            }
          }
        },
      ),
    );
  }

  Widget productsListWidget(bool isDummy) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              AppStyle.width(context) / AppStyle.height(context) * 1.1,
        ),
        scrollDirection: Axis.vertical,
        itemCount: isDummy ? 5 : productController.productList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductTileGrid(
            product: isDummy
                ? AppConstant.dummyProduct
                : productController.productList[index],
          );
        },
      ),
    );
  }
}
