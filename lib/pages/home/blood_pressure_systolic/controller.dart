import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class BloodPressureSystolicController extends GetxController {
  BloodPressureSystolicController();

  final repository = HealthRepository();
  final bloodPressures = ValueNotifier(<BloodPressureSystolic>[]);

  final userRepo = Get.put(UserService());
  final _authRepo = Get.put(AuthService());

  final _db = FirebaseDatabase.instance;
 
  List<BloodPressureSystolic> needs = [];

  Future<Object?> getBloodPressureSystolicData() async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressureSystolic")
        .get();
    return res.value;
  }

  Future loadBloodPressureSystolicData() async {
    var value = await getBloodPressureSystolicData();
    if (value == null) {
      return null;
    }
    var values = value as Map;
    values.forEach((key, value) {
      var jsonData = jsonDecode(jsonEncode(value));
      needs.add(BloodPressureSystolic.fromJson(jsonData));
    });
    print(needs);
  }

  Future<void> getData() async {
    bloodPressures.value = await repository.getBloodPressureSystolic();
    for (var item in bloodPressures.value) {
      print(item.toJson());
      await UserApi().saveBloodPressureSystolicData(item);
    }
  }

  _initData() {
    update(["blood_pressure_systolic"]);
  }

  void onTap() {}

  @override
  void onInit() {
    loadBloodPressureSystolicData();
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
