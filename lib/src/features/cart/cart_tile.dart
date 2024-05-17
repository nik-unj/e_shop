import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/src/features/cart/controller/cart_controller.dart';
import 'package:e_shop/src/features/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  final Products product;
  const CartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return GetBuilder(
      init: cartController,
      builder: (value) {
        return Container(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: AppStyle.secondary,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: AppStyle.smallEdgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppStyle.verysmallEdgeInsets,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.thumbnail ?? '',
                      height: AppStyle.height(context) * 0.12,
                      width: AppStyle.height(context) * 0.12,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? '',
                        style: AppStyle.cartTitle(),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${(product.discountedPrice ?? 0) ~/ (product.quantity ?? 0)}',
                            style: AppStyle.priceStyle(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartController
                                      .increaseQuantity(product.id ?? -1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppStyle.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.add,
                                      color: AppStyle.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  product.quantity.toString(),
                                  style: AppStyle.cartQuantity(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cartController
                                      .decreaseQuantity(product.id ?? -1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppStyle.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.remove,
                                      color: AppStyle.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '\$${product.discountedPrice}',
                          style: AppStyle.priceStyle().copyWith(
                            fontWeight: FontWeight.normal,
                            color: AppStyle.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
