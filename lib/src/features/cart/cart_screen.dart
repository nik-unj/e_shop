import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/custom_button.dart';
import 'package:e_shop/src/features/cart/cart_tile.dart';
import 'package:e_shop/src/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        backgroundColor: AppStyle.primary,
        centerTitle: true,
        title: Text(
          AppString.mycart,
          style: AppStyle.headingOrange().copyWith(color: AppStyle.white),
        ),
      ),
      body: Obx(
        () {
          if (cartController.cartFormzStatus.value.isInProgress) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Padding(
                      padding: AppStyle.mediumEdgeInsets.copyWith(bottom: 0),
                      child: GetBuilder(
                          init: cartController,
                          builder: (value) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppString.subTotal,
                                        style: AppStyle.cartQuantity()),
                                    Text(
                                        '\$${cartController.cartItems[0].total}',
                                        style: AppStyle.cartQuantity()),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppString.saved,
                                        style: AppStyle.cartQuantity()),
                                    Text(
                                      '\$${cartController.cartItems[0].total! - (cartController.cartItems[0].discountedTotal ?? 0).toInt()}',
                                      style: AppStyle.cartQuantity(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppString.total,
                                      style: AppStyle.cartQuantity().copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$${cartController.cartItems[0].discountedTotal}',
                                      style: AppStyle.cartQuantity().copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomButton(name: AppString.buy)
                              ],
                            );
                          }),
                    ),
                    Divider(
                      color: AppStyle.secondary,
                      thickness: 2,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          (cartController.cartItems[0].products ?? []).length,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => CartTile(
                            product:
                                cartController.cartItems[0].products![index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
