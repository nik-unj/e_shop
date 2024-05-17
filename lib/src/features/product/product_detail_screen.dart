import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/constant/global.dart';
import 'package:e_shop/resources/utils/custom_button.dart';
import 'package:e_shop/resources/utils/image_slider.dart';
import 'package:e_shop/src/features/cart/controller/cart_controller.dart';
import 'package:e_shop/src/features/cart/model/cart_model.dart';
import 'package:e_shop/src/features/favourite/controller/favorite_controller.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final cartController = Get.find<CartController>();
  final homeController = Get.find<HomeController>();
  final favoriteController = Get.find<FavoriteController>();
  int discountedPrice = 0;
  bool itemInCart = false;
  bool itemInFavorite = false;

  @override
  void initState() {
    super.initState();
    checkItemInCart();
    checkItemInFavorite();
    setState(() {
      discountedPrice = ((widget.product.price ?? 0) -
              ((widget.product.price ?? 0) *
                      (widget.product.discountPercentage ?? 0)) /
                  100)
          .toInt();
    });
  }

  void checkItemInCart() {
    setState(() {
      itemInCart = cartController.isItemInCart(widget.product.id ?? -1);
    });
  }

  void checkItemInFavorite() {
    setState(() {
      itemInFavorite =
          favoriteController.isItemInFavorite(widget.product.id ?? -1);
    });
  }

  void toggleButton() {
    if (itemInCart) {
      cartController.removeFromCart(widget.product.id ?? -1);
    } else {
      cartController.addToCart(
        Products(
          id: widget.product.id,
          title: widget.product.title,
          price: widget.product.price,
          quantity: 1,
          total: widget.product.price,
          discountPercentage: widget.product.discountPercentage,
          discountedPrice: discountedPrice,
          thumbnail: widget.product.thumbnail,
        ),
      );
    }
  }

  void toggleFavorite() {
    if (itemInFavorite) {
      favoriteController.removeFavorite(widget.product.id ?? -1);
    } else {
      favoriteController.addFavorite(widget.product);
    }
    setState(() {
      itemInFavorite = !itemInFavorite;
    });
  }

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
        title: Text(
          AppString.productDetail,
          style: AppStyle.normalHeading().copyWith(
            color: AppStyle.white,
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                toggleFavorite();
              },
              child: Container(
                decoration: itemInFavorite
                    ? BoxDecoration(
                        border: Border.all(color: AppStyle.white, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      )
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    itemInFavorite ? Icons.favorite : Icons.favorite_border,
                    color: itemInFavorite ? AppStyle.secondary : AppStyle.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ImageSlider(
                    images: widget.product.images ?? [],
                    isNetworkImage: true,
                    aspectRatio: 16 / 12,
                    borderRadius: 25,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title ?? '',
                                style: AppStyle.productName(),
                              ),
                              Text(
                                widget.product.brand ?? '',
                                style: AppStyle.productBrand(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "-${widget.product.discountPercentage}% ",
                            style: AppStyle.productDiscount(),
                          ),
                          Text(
                            " \$$discountedPrice",
                            style:
                                AppStyle.productPrice().copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "M.R.P: \$${(widget.product.price ?? 0)}",
                        style: AppStyle.priceStyle(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppString.description,
                        style: AppStyle.productDesc()
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.product.description ?? '',
                        style: AppStyle.productDesc(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Container(
          //       height: 50,
          //       width: 50,
          //       decoration: BoxDecoration(
          //         color: AppStyle.white,
          //         borderRadius: BorderRadius.circular(25),
          //       ),
          //       child: const Icon(
          //         Icons.favorite_border,
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  name: itemInCart
                      ? AppString.removeFromCart
                      : AppString.addToCart,
                  width: itemInCart
                      ? AppStyle.width(context) * 0.5
                      : AppStyle.width(context) * 0.85,
                  color: itemInCart ? AppStyle.error : AppStyle.secondary,
                  onTap: () {
                    toggleButton();
                    setState(() {
                      itemInCart = !itemInCart;
                    });
                  },
                ),
                itemInCart
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            selectedIndexBottomBar.value = 2;
                          },
                          child: Container(
                            width: AppStyle.width(context) * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppStyle.primary,
                            ),
                            child: Padding(
                              padding: AppStyle.smallEdgeInsets,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FaIcon(
                                    Icons.shopping_cart_outlined,
                                    color: AppStyle.white,
                                  ),
                                  Text(
                                    AppString.cart,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.normalHeading().copyWith(
                                      color: AppStyle.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
