import 'package:get/get.dart';

class SportsIndexController extends GetxController {
  SportsIndexController();

  _initData() {
    update(["sports_index"]);
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
