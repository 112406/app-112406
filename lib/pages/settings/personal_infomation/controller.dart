import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class PersonalInfomationController extends GetxController {
  PersonalInfomationController();

  final _authRepo = Get.put(AuthService());
  final _userRepo = Get.put(UserService());

  // TextController
  // final nameController = TextEditingController();

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return UserApi().profile();
    } else {
      Get.snackbar("Error", "Login to Continue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }



  Future<void> updateRecordName(UserProfileModel user) async {
    _userRepo.setProfile(user);
  }
  // Future<List<UserModel>> getAllUser() async {
  //   final snapshot = await _userRepo.allUser();
  // }

  _initData() {
    update(["personal_infomation"]);
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
