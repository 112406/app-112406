import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../index.dart';

class UserService extends GetxController {
  static UserService get to => Get.find();

  //test
  final _authRepo = Get.put(AuthService());
  // final email = _authRepo.firebaseUser.value?.email;
  final _db = FirebaseDatabase.instance;

  final _isLogin = false.obs;
  // String token = '';
  final _profile = UserProfileModel().obs;
  final _healthData = UserHealthModel().obs;

  /// 是否登入
  bool get isLogin => _isLogin.value;

  /// 用戶 profile
  UserProfileModel get profile => _profile.value;

  /// 用戶 health data
  UserHealthModel get healthData => _healthData.value;

  @override
  void onInit() {
    super.onInit();
    // 讀 token
    // token = Storage().getString(Constants.storageToken);
    // 讀 profile
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      print(profileOffline);
      _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    }
    // 讀 health data
    var healthDataOffline = Storage().getString(Constants.storageHealthData);
    if (healthDataOffline.isNotEmpty) {
      print(healthDataOffline);
      _healthData(UserHealthModel.fromJson(jsonDecode(healthDataOffline)));
    }
  }

  /// 取得用戶 profile
  Future<void> getProfile() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email == null) return;
    UserProfileModel result = await UserApi().profile();
    _profile(result);
    _isLogin.value = true;
    Storage().setString(Constants.storageProfile, jsonEncode(result));
  }

  /// 設定用戶 profile
  Future<void> setProfile(UserProfileModel profile) async {
    // if (token.isEmpty) return;
    
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 取得用戶 health data
  Future<void> getHealthData() async {
    UserHealthModel result = await UserApi().healthData();
    _healthData(result);
    Storage().setString(Constants.storageHealthData, jsonEncode(result));
  }

  /// 設定用戶 health data
  Future<void> setHealthData(UserHealthModel healthData) async {
    _healthData(healthData);
    Storage().setString(Constants.storageHealthData, jsonEncode(healthData));
  }

  /// 登出
  Future<void> logout() async {
    // await Storage().remove(Constants.storageToken);
    /// clear profile and health data
    _profile(UserProfileModel());
    _healthData(UserHealthModel());
    _isLogin.value = false;
  }

  /// 檢查是否登入
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemSignin);
      return false;
    }
    return true;
  }

  /// get healthdata from realtime database
  // Future<void> getHeartRateData() async {
  //   UserProfileModel result = await UserApi().heartRateData();
  //   _profile(result);
  //   // Storage().setString(Constants.storageProfile, jsonEncode(result));
  // }

  // /// store user in realtime database
  // createUser(UserProfileModel user) async {
  //   var res = await _db
  //       .ref("users/${_authRepo.firebaseUser.value!.uid}/profile")
  //       .set(user.toJson())
  //       .whenComplete(
  //         () => Get.snackbar("Success", "You account has been created",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.green.withOpacity(0.1),
  //             colorText: Colors.green),
  //       )
  //       .catchError((error, stackTrace) {
  //     Get.snackbar("Error", "Something went wrong, please Try again",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     print(error.toString());
  //   });
  // }

  // /// save healthdata in realtime database
  // saveHeartRateData(HeartRate req) async {
  //   print(req.dateFrom.toString().trim());
  //   var res = await _db
  //       .ref(
  //           "users/${_authRepo.firebaseUser.value!.uid}/healthData/heartRate/${req.dateFrom.millisecondsSinceEpoch.toString()}")
  //       .set(req.toJson());
  //   // var jsonData = _jsonRegExp(res.value.toString());
  //   // return UserProfileModel.fromJson(res);
  // }

  // saveBloodPressureData(BloodPressure req) async {
  //   var res = await _db
  //       .ref(
  //           "users/${_authRepo.firebaseUser.value!.uid}/healthData/bloodPressure/${req.dateFrom.millisecondsSinceEpoch.toString()}")
  //       .set(req.toJson());
  //   // var jsonData = _jsonRegExp(res.value.toString());
  //   // return UserProfileModel.fromJson(res);
  // }

  // saveSleepHourData(SleepHour req) async {
  //   var res = await _db
  //       .ref(
  //           "users/${_authRepo.firebaseUser.value!.uid}/healthData/SleepHour/${req.dateFrom.millisecondsSinceEpoch.toString()}")
  //       .set(req.toJson());
  //   // var jsonData = _jsonRegExp(res.value.toString());
  //   // return UserProfileModel.fromJson(res);
  // }
}
