import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';

class RegisterController extends GetxController {
  RegisterController();
  GlobalKey formKey = GlobalKey<FormState>();

  // 用戶名
  TextEditingController userNameController =
      TextEditingController(text: "timmy");
  // 郵件
  TextEditingController emailController =
      TextEditingController(text: "spfff91@gmail.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "timmy");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "cat");
  // 密碼
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // 註冊
  void onSignUp() {
    if ((formKey.currentState as FormState).validate()) {
      // AES 加密密碼
      // var password = EncryptUtil().aesEncode(passwordController.text);
      var password = passwordController.text;

      //驗證通過
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: UserRegisterReq(
          username: userNameController.text,
          password: password,
          // email: emailController.text,
          // firstName: firstNameController.text,
          // lastName: lastNameController.text,
        ),
      );
      // 驗證通過提交數據
    }
  }

  // 登錄
  void onSignIn() {
    Get.offNamed(RouteNames.systemLogin);
  }

  _initData() {
    update(["register"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 釋放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
