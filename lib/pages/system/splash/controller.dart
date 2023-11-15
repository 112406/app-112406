import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
    // Get.offAllNamed(RouteNames.main);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
    // 刪除設備啟動圖
    FlutterNativeSplash.remove();
    _jumpToPage();
    // 樣式配置
    // if (ConfigService.to.isAlreadyOpen) {
    //   Get.offAllNamed(RouteNames.systemWelcome);
    // } else {
    //   Get.offAllNamed(RouteNames.main);
    // }

    // Get.toNamed(RouteNames.systemSignup);
    // Get.toNamed(RouteNames.main);
    // Get.toNamed(RouteNames.stylesStylesIndex);
    // Get.toNamed(RouteNames.systemWelcome);
    // @override
    // void onClose() {
    //   super.onClose();
    // }
  }
}
