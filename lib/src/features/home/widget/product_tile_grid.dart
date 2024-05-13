import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop/resources/constant/app_assets.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:e_shop/src/features/product/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductTileGrid extends StatelessWidget {
  final Product product;
  const ProductTileGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: Padding(
        padding: AppStyle.verysmallEdgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppStyle.smallEdgeInsets,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  height: 250,
                  fit: BoxFit.fill,
                  imageUrl: product.thumbnail ?? '',
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppStyle.grey,
                    highlightColor: AppStyle.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppAssets.ad1,
                        fit: BoxFit.fill,
                        height: 250,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: AppStyle.smallEdgeInsets.copyWith(top: 0, bottom: 0),
              child: Text(
                product.title ?? '',
                style: AppStyle.normalHeading(),
                maxLines: 1,
              ),
            ),
            Padding(
              padding: AppStyle.smallEdgeInsets.copyWith(top: 0, bottom: 0),
              child: Text(
                "\$ ${product.price.toString()}",
                style: AppStyle.priceStyle(),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
