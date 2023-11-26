import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/utils/loading.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController();

  /// 表單 key
  GlobalKey formKey = GlobalKey<FormState>();

  /// 定義輸入控制器
  TextEditingController emailaddressController = TextEditingController();

  _initData() {
    update(["forgot_password"]);
  }

  void onTap() {}

  /// Reset Password
  Future<void> onResetPassword() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();
        var email = emailaddressController.text;
        String? error = await AuthService.to.resetPassword(email);
        if (error != null) {
          print("some error happend");
          print(error.toString());
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: error.toString(),
          ));
          Loading.error();
        } else {
          print("重設密碼成功");
          Loading.success(LocaleKeys.resetPasswordEmailSent.tr);
          // Get.offNamed(RouteNames.systemSignin);
        }
      } finally {
        Loading.dismiss();
      }
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
