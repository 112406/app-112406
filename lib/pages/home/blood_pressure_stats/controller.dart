import 'package:get/get.dart';

class BloodPressureStatsController extends GetxController {
  BloodPressureStatsController();

  _initData() {
    update(["blood_pressure_stats"]);
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
