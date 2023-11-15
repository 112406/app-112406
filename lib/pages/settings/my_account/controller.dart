import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class MyAccountController extends GetxController {
  MyAccountController();
  var notifyHelper;

  // 註銷
  void onLogout() {
    UserService.to.logout();
    AuthService.to.logout();

    Get.offNamed(RouteNames.systemSignin);
  }

  _initData() {
    update(["my_account"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions();
  }

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
