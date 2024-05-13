import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/custom_appbar.dart';
import 'package:e_shop/resources/utils/image_slider.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: customAppBar(
        Text(
          AppString.productDetail,
          style: AppStyle.normalHeading().copyWith(
            color: AppStyle.white,
            fontSize: 25,
          ),
        ),
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
                    images: product.images ?? [],
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
                                product.title ?? '',
                                style: AppStyle.productName(),
                              ),
                              Text(
                                product.brand ?? '',
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
                            "-${product.discountPercentage}% ",
                            style: AppStyle.productDiscount(),
                          ),
                          Text(
                            " \$${((product.price ?? 0) - ((product.price ?? 0) * (product.discountPercentage ?? 0)) / 100).toInt()}",
                            style:
                                AppStyle.productPrice().copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "M.R.P: \$${(product.price ?? 0)}",
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
                        product.description ?? '',
                        style: AppStyle.productDesc(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                width: AppStyle.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppStyle.primary,
                ),
                child: Padding(
                  padding: AppStyle.smallEdgeInsets,
                  child: Text(
                    AppString.addToCart,
                    textAlign: TextAlign.center,
                    style: AppStyle.normalHeading().copyWith(
                      color: AppStyle.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
