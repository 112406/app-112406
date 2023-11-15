import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import '../../../common/services/health_repository.dart';

class BloodPressureController extends GetxController {
  BloodPressureController();

  final repository = HealthRepository();
  final bloodPressures = ValueNotifier(<BloodPressure>[]);

  final userRepo = Get.put(UserService());
  final _authRepo = Get.put(AuthService());

  final _db = FirebaseDatabase.instance;

  List<BloodPressure> needs = [];

  Future<Object?> getBloodPressureData() async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressure")
        .get();
    return res.value;
  }

  Future loadBloodPressureData() async {
    var value = await getBloodPressureData();
    if (value == null) {
      return null;
    }
    var values = value as Map;
    // Map<dynamic, dynamic> values = await getHeartRateData() as Map;
    values.forEach((key, value) {
      var jsonData = jsonDecode(jsonEncode(value));
      needs.add(BloodPressure.fromJson(jsonData));
      // for (var element in needs) {
      //   print(element.value);
      // }
    });
    print(needs);
  }

  Future<void> getData() async {
    bloodPressures.value = await repository.getBloodPressure();
    for (var item in bloodPressures.value) {
      print(item.toJson());
      await UserApi().saveBloodPressureData(item);
    }
  }

  _initData() {
    update(["blood_pressure"]);
  }

  void onTap() {}

  @override
  void onInit() {
    loadBloodPressureData();
    super.onInit();
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
