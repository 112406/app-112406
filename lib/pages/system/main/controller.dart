import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class MainController extends GetxController {
  MainController();

  // 分頁管理
  final PageController pageController = PageController();

  // 當前的 tab index
  int currentIndex = 0;

  // 導航欄切換
  void onIndexChanged(int index) {
    currentIndex = index;
    update(['navigation']);
  }

  // 切換頁面
  void onJumpToPage(int page) {
    print("onJumpToPage: $page");
    if ((page != 0) && !UserService.to.isLogin) {
      Get.toNamed(RouteNames.systemSignin);
    } else {
      pageController.jumpToPage(page);
    }
  }

  _initData() async {
    // 讀取用戶 profile
    await UserService.to.getProfile();
    // await UserApi().getHeartRateData();
    // await UserService.to.getHealthData();
    update(["main"]);
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

  @override
  void onClose() {
    super.onClose();
    // 釋放頁控制器
    pageController.dispose();
  }
}
