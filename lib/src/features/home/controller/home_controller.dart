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
