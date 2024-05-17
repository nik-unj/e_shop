import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/global.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/src/features/cart/model/cart_model.dart';
import 'package:e_shop/src/features/cart/service/cart_service.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<FormzSubmissionStatus> cartFormzStatus = FormzSubmissionStatus.initial.obs;
  RxString errorMessage = ''.obs;
  RxList<Cart> cartItems = RxList<Cart>();

  @override
  void onInit() {
    getCart(userId.value);
    super.onInit();
  }

  Future<void> getCart(int userId) async {
    try {
      cartFormzStatus.value = FormzSubmissionStatus.inProgress;
      ApiResult result = await CartService.getCart(userId);
      if (result is ApiSuccess) {
        cartItems.value = List.from(
            result.data['carts'].map((e) => Cart.fromMap(e)).toList());
        cartFormzStatus.value = FormzSubmissionStatus.success;
      } else {
        errorMessage.value =
            (result as ApiFailure).errorMessage ?? AppString.error;
        cartFormzStatus.value = FormzSubmissionStatus.failure;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      cartFormzStatus.value = FormzSubmissionStatus.failure;
    }
  }

  void addToCart(Products product) {
    (cartItems[0].products ?? []).add(product);
  }

  void removeFromCart(int pid) {
    (cartItems[0].products ?? []).removeWhere((element) => pid == element.id);
  }

  bool isItemInCart(int pid) {
    for (Products p in (cartItems[0].products ?? [])) {
      if (pid == p.id) {
        return true;
      }
    }
    return false;
  }

  void increaseQuantity(int pid) {
    for (var element in (cartItems[0].products ?? [])) {
      if (pid == element.id) {
        int disPrice = (element.discountedPrice / element.quantity).toInt();
        element.quantity = (element.quantity ?? 0) + 1;
        element.total = element.price * element.quantity;
        element.discountedPrice = disPrice * element.quantity;
        cartItems.first.total = ((cartItems.first.total ?? 0) +
            (element.price ?? 0).toInt()) as int?;
        cartItems.first.discountedTotal =
            (cartItems.first.discountedTotal ?? 0) + disPrice;
      }
    }
    update();
  }

  void decreaseQuantity(int pid) {
    for (var element in (cartItems[0].products ?? [])) {
      if (pid == element.id && element.quantity > 1) {
        int disPrice = (element.discountedPrice / element.quantity).toInt();
        element.quantity = (element.quantity ?? 0) - 1;
        element.total = element.price * element.quantity;
        element.discountedPrice = disPrice * element.quantity;
        cartItems.first.total = ((cartItems.first.total ?? 0) -
            (element.price ?? 0).toInt()) as int?;
        cartItems.first.discountedTotal =
            (cartItems.first.discountedTotal ?? 0) - disPrice;
      }
    }
    update();
  }
}
