import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityMainController extends GetxController {
  CommunityMainController();

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
    pageController.jumpToPage(page);
  }

  _initData() {
    update(["community_main"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
