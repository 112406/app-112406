import 'package:get/get.dart';

class AchievementIndexController extends GetxController {
  AchievementIndexController();

  _initData() {
    update(["achievement_index"]);
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
