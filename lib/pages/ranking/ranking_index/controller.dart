import 'package:get/get.dart';

class RankingIndexController extends GetxController {
  RankingIndexController();

  _initData() {
    update(["ranking_index"]);
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
