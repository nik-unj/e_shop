import 'package:e_shop/resources/constant/app_assets.dart';
import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/utils/custom_button.dart';
import 'package:e_shop/src/features/login/controller/login_controller.dart';
import 'package:e_shop/src/features/login/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 107, 204, 213),
            Color.fromARGB(255, 75, 160, 167),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() {
              if (loginController.loginFormzStatus.value.isInProgress) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppStyle.height(context) * 0.45),
                      CircularProgressIndicator(
                        color: AppStyle.white,
                      ),
                      Text(
                        AppString.settingUp,
                        style: AppStyle.headingOrange()
                            .copyWith(color: AppStyle.white),
                      )
                    ],
                  ),
                );
              } else if (loginController.loginFormzStatus.value.isFailure) {
                return Text(loginController.errorMessage.value);
              } else {
                return Padding(
                  padding: AppStyle.smallEdgeInsets,
                  child: Column(
                    children: [
                      SizedBox(height: AppStyle.height(context) * 0.1),
                      Text(
                        AppString.goodDay,
                        style: AppStyle.headingOrange()
                            .copyWith(color: AppStyle.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppString.login,
                        style: AppStyle.headingOrange()
                            .copyWith(color: AppStyle.white),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: AppStyle.verysmallEdgeInsets,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppAssets.loginImage,
                            height: AppStyle.height(context) * 0.3,
                            width: AppStyle.width(context) * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: loginController.usernameController,
                        hintText: "Username",
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: loginController.passwordController,
                        hintText: "Password",
                        showPassword: loginController.showPassword.value,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: loginController.showPassword.value,
                            onChanged: (value) {
                              loginController.showPassword.value =
                                  !loginController.showPassword.value;
                            },
                            checkColor: AppStyle.white,
                            activeColor: AppStyle.primary,
                            side: BorderSide(
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            AppString.showPassword,
                            style: AppStyle.textFieldStyle()
                                .copyWith(color: AppStyle.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        name: AppString.login,
                        onTap: () {
                          loginController.doLogin();
                        },
                        width: AppStyle.width(context) / 2,
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
