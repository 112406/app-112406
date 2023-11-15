import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/services/health_repository.dart';

class SleepTrackerController extends GetxController {
  SleepTrackerController();

  final repository = HealthRepository();
  final sleephours = ValueNotifier(<SleepHour>[]);

  final userRepo = Get.put(UserService());

  Future<void> getData() async {
    sleephours.value = await repository.getSleep();
    for (var item in sleephours.value) {
      print(item.toJson());
      await UserApi().saveSleepHourData(item);
    }
  }

  _initData() {
    update(["sleep_tracker"]);
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
