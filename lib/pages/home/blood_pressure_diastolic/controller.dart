import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodPressureDiastolicController extends GetxController {
  BloodPressureDiastolicController();

  late ZoomPanBehavior zoomPanBehavior;

  final repository = HealthRepository();
  final bloodPressures = ValueNotifier(<BloodPressureDiastolic>[]);

  final userRepo = Get.put(UserService());
  final _authRepo = Get.put(AuthService());

  final _db = FirebaseDatabase.instance;

  List<BloodPressureDiastolic> needs = [];

  Future<Object?> getBloodPressureDiastolicData() async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressureDiastolic")
        .get();
    return res.value;
  }

  Future loadBloodPressureDiastolicData() async {
    var value = await getBloodPressureDiastolicData();
    if (value == null) {
      return null;
    }
    var values = value as Map;
    values.forEach((key, value) {
      var jsonData = jsonDecode(jsonEncode(value));
      needs.add(BloodPressureDiastolic.fromJson(jsonData));
    });
    needs.sort((a, b) => a.dateFrom.compareTo(b.dateFrom));
    print(needs);
  }

  Future<void> getData() async {
    bloodPressures.value = await repository.getBloodPressureDiastolic();
    for (var item in bloodPressures.value) {
      print(item.toJson());
      await UserApi().saveBloodPressureDiastolicData(item);
    }
  }

  _initData() {
    update(["blood_pressure_diastolic"]);
  }

  void onTap() {}

  @override
  void onInit() {
    loadBloodPressureDiastolicData();
    zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
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
