import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // 註冊界面傳值
  UserRegisterReq? req = Get.arguments;

  // ping 文字輸入控制器
  TextEditingController pinController = TextEditingController();

  // 表單 key
  GlobalKey formKey = GlobalKey<FormState>();

  // 驗證 pin
  String? pinValidator(val) {
    return val == '111111'
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  // 註冊
  Future<void> _register() async {
    try {
      Loading.show();

      // 暫時提交，後續改 aes 加密後處理
      bool isOk = await UserApi.register(req);
      if (isOk) {
        Loading.success(
            LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
        Get.back(result: true);
      }

      // // 提示成功
      // Loading.success(
      //     LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
      // Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
  }

  _initData() {
    update(["register_pin"]);
  }

  // pin 觸發提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
  }

  // 按鈕提交
  void onBtnSubmit() {
    _register();
  }

  // 按鈕返回
  void onBtnBackup() {
    Get.back();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }
}
