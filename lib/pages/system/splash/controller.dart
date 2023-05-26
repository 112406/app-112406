import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  // _initData() {
  //   update(["splash"]);
  // }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    // 刪除設備啟動圖
    FlutterNativeSplash.remove();
    // 樣式配置
    if (ConfigService.to.isAlreadyOpen) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }
    // _initData();
    _jumpToPage(); // 跳轉界面
  }

  _jumpToPage() {
    Get.offAllNamed(RouteNames.main);

    // Get.toNamed(RouteNames.stylesStylesIndex);

    // if (ConfigService.to.isFirstOpen == false) {
    //   Get.offAllNamed(RouteNames.systemWelcome);
    // } else {
    //   Get.offAllNamed(RouteNames.main);
    // }
    // 歡迎頁
    // Future.delayed(const Duration(seconds: 1), () {
    //   Get.offAllNamed(RouteNames.systemWelcome);
    // });
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
