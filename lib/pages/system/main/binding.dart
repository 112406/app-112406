import 'package:get/get.dart';
import 'package:healthcare_app/pages/index.dart';

/// 主介面依賴
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeIndexController>(() => HomeIndexController());
    // Get.lazyPut<CartIndexController>(() => CartIndexController());
    // Get.lazyPut<MsgIndexController>(() => MsgIndexController());
    // Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<WellnessIndexController>(() => WellnessIndexController());
    Get.lazyPut<TrackerIndexController>(() => TrackerIndexController());
    // Get.lazyPut<SettingsIndexController>(() => SettingsIndexController());
    Get.lazyPut<MyAccountController>(() => MyAccountController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
