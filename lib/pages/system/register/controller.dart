import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // 驗證通過提交數據
    }
  }

  // 登錄
  void onSignIn() {}

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
