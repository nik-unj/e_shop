import 'package:formz/formz.dart';
import 'package:get/get.dart';

import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:e_shop/src/features/product/service/product_service.dart';

class ProductController extends GetxController {
  Rx<FormzSubmissionStatus> productFormzStatus =
      FormzSubmissionStatus.initial.obs;
  RxList<Product> productList = RxList<Product>();
  RxString errorMessage = ''.obs;

  Future<void> getProductsByCategory(String category) async {
    try {
      productFormzStatus.value = FormzSubmissionStatus.inProgress;
      ApiResult result = await ProductService.getProductsByCategory(category);
      if (result is ApiSuccess) {
        productList.value = List.from(
            result.data['products'].map((e) => Product.fromMap(e)).toList());
        productFormzStatus.value = FormzSubmissionStatus.success;
      } else {
        errorMessage.value =
            (result as ApiFailure).errorMessage ?? AppString.error;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      productFormzStatus.value = FormzSubmissionStatus.failure;
    }
  }

  Future<void> getProductsBySearch(String productName) async {
    try {
      productFormzStatus.value = FormzSubmissionStatus.inProgress;
      ApiResult result = await ProductService.searchProduct(productName);
      if (result is ApiSuccess) {
        productList.value = List.from(
            result.data['products'].map((e) => Product.fromMap(e)).toList());
        productFormzStatus.value = FormzSubmissionStatus.success;
      } else {
        errorMessage.value =
            (result as ApiFailure).errorMessage ?? AppString.error;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      productFormzStatus.value = FormzSubmissionStatus.failure;
    }
  }
}
