import 'package:get/get.dart';

class HistoryDetailsController extends GetxController {
  HistoryDetailsController();

  _initData() {
    update(["history_details"]);
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
