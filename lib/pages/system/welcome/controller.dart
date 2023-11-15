import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  // _initData() {
  //   update(["welcome"]);
  // }

  void onTap() {}

  List<WelcomeModel>? items;

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.darkaidoctorPng,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.darkfitnesstrackerPng,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.darkchatbotPng,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
    update(["slider"]);
  }

  @override
  void onReady() {
    super.onReady();
    // 設置已打開
    ConfigService().setAlreadyOpen();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
