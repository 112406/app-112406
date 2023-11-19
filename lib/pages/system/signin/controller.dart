import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/services/auth_repository.dart';
import 'package:healthcare_app/common/utils/loading.dart';

class SigninController extends GetxController {
  SigninController();

  /// 表單 key
  GlobalKey formKey = GlobalKey<FormState>();

  // final FirebaseAuthService _auth = FirebaseAuthService();

  /// 定義輸入控制器
  TextEditingController emailaddressController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        var email = emailaddressController.text;
        var password = passwordController.text;

        String? error =
            await AuthService.to.loginWithEmailAndPassword(email, password);
        if (error != null) {
          print("some error happend");
          // print(error.toString());
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: error.toString(),
          ));
          Loading.error();
        } else {
          // print(error.toString());
          // 取得用戶資料
          await UserService.to.getProfile();
          // await UserService.to.getProfile();
          print("登入成功");
          Loading.success();
          Get.offNamed(RouteNames.main);
          // print(user);
        }

        // User? user = await _auth.signInWithEmailAndPassword(
        //     email: email, password: password);

        // if (user != null) {
        //   print("登入成功");
        //   Get.offNamed(RouteNames.main);
        //   Loading.success();
        //   // print(user);
        // } else {
        //   print("some error happend");
        //   Loading.error();
        //   // print(user);
        // }

        // // aes 加密密碼
        // var password = EncryptUtil().aesEncode(passwordController.text);

        // // api 請求
        // UserTokenModel res = await UserApi.login(UserLoginReq(
        //   username: userNameController.text,
        //   password: password,
        // ));

        // // 本地保存 token
        // await UserService.to.setToken(res.token!);
        // // 取得用戶資料
        // await UserService.to.getProfile();

        // Loading.success();
        // Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemSignup);
  }

  /// 釋放
  @override
  void onClose() {
    super.onClose();
    emailaddressController.dispose();
    passwordController.dispose();
  }

  _initData() {
    update(["signin"]);
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
