import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:healthcare_app/common/services/health_repository.dart';

class SleepTrackerController extends GetxController {
  SleepTrackerController();

  final repository = HealthRepository();
  final steps = ValueNotifier(<Steps>[]);

  final _authRepo = Get.put(AuthService());

  final _db = FirebaseDatabase.instance;

  List<Steps> needs = [];

  final userRepo = Get.put(UserService());

  Future<Object?> getStepsData() async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/steps")
        .get();
    return res.value;
  }

  Future loadStepsData() async {
    var value = await getStepsData();
    if (value == null) {
      return null;
    }
    var values = value as Map;
    // Map<dynamic, dynamic> values = await getHeartRateData() as Map;
    values.forEach((key, value) {
      var jsonData = jsonDecode(jsonEncode(value));
      needs.add(Steps.fromJson(jsonData));
      // for (var element in needs) {
      //   print(element.value);
      // }
    });
    print(needs);
  }

  Future<void> getData() async {
    steps.value = await repository.getStep();
    for (var item in steps.value) {
      print(item.toJson());
      await UserApi().saveStepsData(item);
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
