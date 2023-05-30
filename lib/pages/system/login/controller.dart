import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

class LoginController extends GetxController {
  LoginController();

  /// 定義輸入控制器
  TextEditingController userNameController =
      TextEditingController(text: "test-user123");
  TextEditingController passwordController =
      TextEditingController(text: "testpassword123");

  /// 表單 key
  GlobalKey formKey = GlobalKey<FormState>();

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // AES加密
        var password = EncryptUtil().aesEncode(passwordController.text);

        // api 請求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: passwordController.text,
        ));

        // 本地保存 token
        await UserService.to.setToken(res.token!);

        //獲取用戶資料
        // await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  /// 釋放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  _initData() {
    update(["login"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
