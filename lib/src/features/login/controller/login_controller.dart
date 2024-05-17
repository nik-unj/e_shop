import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/global.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/src/features/bottom_bar/bottom_bar.dart';
import 'package:e_shop/src/features/login/model/user_model.dart';
import 'package:e_shop/src/features/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<FormzSubmissionStatus> loginFormzStatus =
      FormzSubmissionStatus.initial.obs;
  RxString errorMessage = ''.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;
  Rxn<User> user = Rxn<User>();

  void doLogin() async {
    try {
      loginFormzStatus.value = FormzSubmissionStatus.inProgress;
      ApiResult result = await LoginService.userLogin(
          usernameController.text, passwordController.text);
      if (result is ApiSuccess) {
        user.value = User.fromMap(result.data);
        name.value = user.value!.username ?? '';
        userId.value = user.value!.id ?? 0;
        Get.offAll(() => const BottomBar());
      } else {
        errorMessage.value =
            (result as ApiFailure).errorMessage ?? AppString.error;
        loginFormzStatus.value = FormzSubmissionStatus.failure;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      loginFormzStatus.value = FormzSubmissionStatus.failure;
    }
  }
}
