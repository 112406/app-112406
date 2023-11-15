import 'package:get/get.dart';

import '../../../common/index.dart';

class SettingsIndexController extends GetxController {
  SettingsIndexController();

  _initData() {
    update(["settings_index"]);
  }

  void onTap() {}

  // 註銷
  void onLogout() {
    UserService.to.logout();
    AuthService.to.logout();

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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
