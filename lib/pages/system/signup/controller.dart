import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class SignupController extends GetxController {
  SignupController();

  GlobalKey formKey = GlobalKey<FormState>();

  // final FirebaseAuthService _auth = FirebaseAuthService();

  // 用戶名
  TextEditingController userNameController = TextEditingController();

  // 郵件
  TextEditingController emailController = TextEditingController();

  // 密碼
  TextEditingController passwordController = TextEditingController();

  // 密碼確認
  TextEditingController confirmPasswordController = TextEditingController();

  final userRepo = Get.put(UserService());

  _initData() {
    update(["signup"]);
  }

  void onTap() {}

  // 註冊
  void onSignUp() async {
    if ((formKey.currentState as FormState).validate()) {
      // 驗證通過提交數據
      var username = userNameController.text;
      var email = emailController.text;
      var password = passwordController.text;

      // User? user = await _auth.signUpWithEmailAndPassword(
      //     email: email, password: password);

      String? error =
          await AuthService.to.createUserWithEmailAndPassword(email, password);
      if (error != null) {
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          message: error.toString(),
        ));
        // Get.toNamed(RouteNames.main);
      } else {
        Get.toNamed(RouteNames.main);
      }

      final userModel = UserProfileModel(
        name: username,
        email: email,
      );
      await UserApi().createUser(userModel);

      // if (user != null) {
      //   print("註冊成功");
      //   Get.toNamed(RouteNames.main);
      // } else {
      //   print("some error happend");
      // }
    }
  }

  // Get from user and pass it to Auth Repository for Firebase Authentication
  // Future<void> createUser(UserProfileModel user) async {
  //   // await userRepo.createUser(user);
  //   await UserApi.createUser(user);
  // }

  // 登入
  void onSignIn() {
    if ((formKey.currentState as FormState).validate()) {
      // aes 加密密碼
      // var password = EncryptUtil().aesEncode(passwordController.text);
      var password = passwordController.text;

      // 驗證透過
      // Get.offNamed(
      //   RouteNames.systemRegisterPin,
      //   arguments: UserRegisterReq(
      //     username: userNameController.text,
      //     email: emailController.text,
      //     firstName: firstNameController.text,
      //     lastName: lastNameController.text,
      //     password: password,
      //   ),
      // );
    }
    Get.offNamed(RouteNames.systemSignin);
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

  // 釋放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    // firstNameController.dispose();
    // lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
