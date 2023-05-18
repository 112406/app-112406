import 'package:get/get.dart';
import 'package:project_fitness/pages/system/login_quick/index.dart';

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

  @override
  void onReady() {
    super.onReady();
    _initData();

    Get.to(const LoginQuickPage());
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
