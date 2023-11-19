import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class UserApi {
  final _authRepo = Get.put(AuthService());
  final _db = FirebaseDatabase.instance;

  /// json RegExp function
  dynamic _jsonRegExp(String json) {
    return json
        .replaceAll(RegExp(r'\s+'), '')
        .replaceAll(RegExp(r':'), '":"')
        .replaceAll(RegExp(r','), '","')
        .replaceAll(RegExp(r'{'), '{"')
        .replaceAll(RegExp(r'}'), '"}');
  }

  // Future<List<HeartRate>> getHeartRateData() async {
  //   List<HeartRate> needs = [];
  //   try{
  //     await _db
  //         .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
  //         .get()
  //         .then((DataSnapshot snapshot) {
  //       Map<dynamic, dynamic> values = snapshot.value as Map;
  //       values.forEach((key, value) {
  //         var jsonData = jsonDecode(jsonEncode(value));
  //         needs.add(HeartRate.fromJson(jsonData));
  //         // for (var element in needs) {
  //         //   print(element.value);
  //         // }
  //       });
  //       return needs;
  //     });
  //   // await _db
  //   //     .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
  //   //     .get()
  //   //     .then((DataSnapshot snapshot) {
  //   //   Map<dynamic, dynamic> values = snapshot.value as Map;
  //   //   values.forEach((key, value) {
  //   //     var jsonData = jsonDecode(jsonEncode(value));
  //   //     needs.add(HeartRate.fromJson(jsonData));
  //   //     // for (var element in needs) {
  //   //     //   print(element.value);
  //   //     // }
  //   //   });
  //   //   return needs;
  //   // });
  // } catch (e) {
  //     print(e);
  //   }
  //   throw Exception('Failed to load data');
  // }

  /// Profile
  Future<UserProfileModel> profile() async {
    var res = await _db
        .ref("users/${_authRepo.firebaseUser.value!.uid}/profile")
        .get();
    var jsonData = _jsonRegExp(res.value.toString());
    jsonData = jsonDecode(jsonData);
    print(jsonData);
    return UserProfileModel.fromJson(jsonData);
  }

  /// Health Data
  Future<UserHealthModel> healthData() async {
    var res = await _db
        .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData")
        .get();
    var jsonData = _jsonRegExp(res.value.toString());
    jsonData = jsonDecode(jsonData);
    print(jsonData);
    return UserHealthModel.fromJson(jsonData);
  }

  /// store user in realtime database
  Future<void> createUser(UserProfileModel user) async {
    var res = await _db
        .ref("users/${_authRepo.firebaseUser.value!.uid}/profile")
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "You account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, please Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  /// save healthdata in realtime database
  Future<void> saveHeartRateData(HeartRate req) async {
    print(req.dateFrom.toString().trim());
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate/${req.dateFrom.millisecondsSinceEpoch.toString()}")
        .set(req.toJson());
    // var jsonData = _jsonRegExp(res.value.toString());
    // return UserProfileModel.fromJson(res);
  }

  Future<void> saveBloodPressureSystolicData(BloodPressureSystolic req) async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressureSystolic/${req.dateFrom.millisecondsSinceEpoch.toString()}")
        .set(req.toJson());
    // var jsonData = _jsonRegExp(res.value.toString());
    // return UserProfileModel.fromJson(res);
  }

  Future<void> saveBloodPressureDiastolicData(BloodPressureDiastolic req) async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressureDiastolic/${req.dateFrom.millisecondsSinceEpoch.toString()}")
        .set(req.toJson());
    // var jsonData = _jsonRegExp(res.value.toString());
    // return UserProfileModel.fromJson(res);
  }

  Future<void> saveStepsData(Steps req) async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/steps/${req.dateFrom.millisecondsSinceEpoch.toString()}")
        .set(req.toJson());
    // var jsonData = _jsonRegExp(res.value.toString());
    // return UserProfileModel.fromJson(res);
  }

  Future<void> saveSleepHourData(SleepHour req) async {
    var res = await _db
        .ref(
            "users/${_authRepo.firebaseUser.value!.uid}/healthData/SleepHour/${req.dateFrom.millisecondsSinceEpoch.toString()}")
        .set(req.toJson());
    // var jsonData = _jsonRegExp(res.value.toString());
    // return UserProfileModel.fromJson(res);
  }

  /// get HeartRate data
  // Future<UserProfileModel> heartRateData() async {
  //   var res = await _db
  //       .ref("users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate")
  //       .get();
  //   var jsonData = _jsonRegExp(res.value.toString());
  //   jsonData = jsonDecode(jsonData);
  //   print(jsonData);
  //   return UserProfileModel.fromJson(jsonData);
  // }
}
