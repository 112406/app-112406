import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/services/health_repository.dart';

class HeartRateController extends GetxController {
  HeartRateController();

  late ZoomPanBehavior zoomPanBehavior;

  final repository = HealthRepository();
  final heartRates = ValueNotifier(<HeartRate>[]);

  final _db = FirebaseDatabase.instance;

  final userRepo = Get.put(UserService());
  final _authRepo = Get.put(AuthService());

  List<HeartRate> needs = [];

  Future<Object?> getHeartRateData() async {
    // List<HeartRate> needs = [];
    // needs = [];

    var res = await _db
        .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
        .get();
    // if (res.value == null) {
    //   return ;``
    // }
    // print(res.value);

    // print(res.value);
    return res.value;
    // Map<dynamic, dynamic> values = res.value as Map;
    // values.forEach((key, value) {
    //   var jsonData = jsonDecode(jsonEncode(value));
    //   needs.add(HeartRate.fromJson(jsonData));
    //   // for (var element in needs) {
    //   //   print(element.value);
    //   // }
    // });

    // print(needs);

    // return needs;

    // await _db
    //     .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
    //     .get()
    //     .then((DataSnapshot snapshot) {
    //   Map<dynamic, dynamic> values = snapshot.value as Map;
    //   values.forEach((key, value) {
    //     var jsonData = jsonDecode(jsonEncode(value));
    //     needs.add(HeartRate.fromJson(jsonData));
    //     // for (var element in needs) {
    //     //   print(element.value);
    //     // }
    //   });
    //   return needs;
    // });
  }

  Future loadHeartData() async {
    var value = await getHeartRateData();
    if (value == null) {
      return null;
    }
    var values = value as Map;
    // Map<dynamic, dynamic> values = await getHeartRateData() as Map;
    values.forEach((key, value) {
      var jsonData = jsonDecode(jsonEncode(value));
      needs.add(HeartRate.fromJson(jsonData));
      // for (var element in needs) {
      //   print(element.value);
      // }
    });
    needs.sort((a, b) => a.dateFrom.compareTo(b.dateFrom));
    print(needs.last.dateFrom);
  }

  // Future<void> saveHeartRate (HeartRate user) async {
  //   await userRepo.saveHeartRateData(user);
  // }

  Future<void> getData() async {
    heartRates.value = await repository.getHeartRate();
    // print(heartRates.value.first); // 4 instance
    for (var item in heartRates.value) {
      print(item.toJson());
      await UserApi().saveHeartRateData(item);
    }

    // await userRepo.saveHeartRateData(heartRates.value);
  }

  // Future<void> getHeartRateData() async {
  //   await UserApi().getHeartRateData();
  // }

  // Future<String> getJsonFromHeart() async {
  //   return await _db
  //         .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
  //         .get()
  // }

  _initData() {
    update(["heart_rate"]);
  }

  void onTap() {}

  @override
  void onInit() {
    loadHeartData();
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
}
