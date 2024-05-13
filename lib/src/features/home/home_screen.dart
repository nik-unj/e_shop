import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/image_slider.dart';
import 'package:e_shop/resources/utils/search_bar.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/home/widget/category_icon.dart';
import 'package:e_shop/src/features/home/widget/product_tile_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primary,
      appBar: AppBar(
        backgroundColor: AppStyle.primary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.goodDay,
              style: AppStyle.normalText().copyWith(color: AppStyle.white),
            ),
            Text(
              "Name",
              style: AppStyle.headingOrange().copyWith(color: AppStyle.white),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Obx(
          () {
            if (homeController.homeFormzStatus.value.isInProgress) {
              return Skeletonizer(
                child: ListView(
                  children: [
                    Container(
                      color: AppStyle.primary,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 18,
                              right: 18,
                            ),
                            child: SearchBarField(
                              controller: homeController.searchController,
                              navigateToProductScreen: true,
                            ),
                          ),
                          categoryListWidget(),
                        ],
                      ),
                    ),
                    Container(
                      width: AppStyle.width(context),
                      decoration: BoxDecoration(
                        color: AppStyle.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          children: [
                            ImageSlider(
                              images: AppConstant.adImageList,
                              borderRadius: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: newProductsListWidget(true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (homeController.homeFormzStatus.value.isSuccess) {
              return ListView(
                children: [
                  Container(
                    color: AppStyle.primary,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 18,
                            right: 18,
                          ),
                          child: SearchBarField(
                            controller: homeController.searchController,
                            navigateToProductScreen: true,
                          ),
                        ),
                        categoryListWidget(),
                      ],
                    ),
                  ),
                  Container(
                    width: AppStyle.width(context),
                    decoration: BoxDecoration(
                      color: AppStyle.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Column(
                        children: [
                          ImageSlider(
                            images: AppConstant.adImageList,
                            borderRadius: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: newProductsListWidget(false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Text(AppString.error);
            }
          },
        ),
      ),
    );
  }

  Widget categoryListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              AppString.categories.toUpperCase(),
              style: AppStyle.headingOrange().copyWith(
                color: AppStyle.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: AppStyle.height(context) * 0.13,
              child: ListView.builder(
                itemCount: AppConstant.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryIcon(
                    name: AppConstant.categoryList[index]['name'],
                    imageUrl: AppConstant.categoryList[index]['imageUrl'],
                    url: AppConstant.categoryList[index]['url'],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget newProductsListWidget(bool isDummy) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.newItems.toUpperCase(),
            style: AppStyle.headingOrange(),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  AppStyle.width(context) / AppStyle.height(context) * 1.1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: isDummy ? 6 : homeController.newProductsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductTileGrid(
                product: isDummy
                    ? homeController.dummyProduct
                    : homeController.newProductsList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
