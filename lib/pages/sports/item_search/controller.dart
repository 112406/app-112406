import 'package:get/get.dart';

class ItemSearchController extends GetxController {
  ItemSearchController();

  _initData() {
    update(["item_search"]);
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
