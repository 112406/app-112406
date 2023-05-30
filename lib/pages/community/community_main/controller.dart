import 'package:get/get.dart';

class CommunityMainController extends GetxController {
  CommunityMainController();

  _initData() {
    update(["community_main"]);
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
