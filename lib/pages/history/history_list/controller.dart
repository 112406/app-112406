import 'package:get/get.dart';

class HistoryListController extends GetxController {
  HistoryListController();

  _initData() {
    update(["history_list"]);
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
