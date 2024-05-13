import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:e_shop/src/features/home/service/home_service.dart';

class HomeController extends GetxController {
  Rx<FormzSubmissionStatus> homeFormzStatus = FormzSubmissionStatus.initial.obs;
  RxList<Product> newProductsList = RxList<Product>();
  TextEditingController searchController = TextEditingController();
  RxString errorMessage = ''.obs;
  Product dummyProduct = Product(
    id: 1,
    title: " iPhone 9",
    description: "An apple mobile which is nothing like apple",
    price: 549,
    discountPercentage: 12.96,
    rating: 4.69,
    stock: 94,
    brand: "Apple",
    category: "smartphones",
    thumbnail: "https://cdn.dummyjson.com/product-images/10/2.jpg",
    images: [],
  );

  @override
  void onInit() {
    super.onInit();
    getNewProducts();
  }

  Future<void> getNewProducts() async {
    try {
      homeFormzStatus.value = FormzSubmissionStatus.inProgress;
      ApiResult result = await HomeService.getProducts(1);
      if (result is ApiSuccess) {
        newProductsList.value = List.from(
            result.data['products'].map((e) => Product.fromMap(e)).toList());
        homeFormzStatus.value = FormzSubmissionStatus.success;
      } else {
        errorMessage.value =
            (result as ApiFailure).errorMessage ?? AppString.error;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      homeFormzStatus.value = FormzSubmissionStatus.failure;
    }
  }
}
