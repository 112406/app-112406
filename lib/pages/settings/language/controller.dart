import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

class LanguageController extends GetxController {
  LanguageController();

  // 多語言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];
    var ja = Translation.supportedLocales[2];
    
    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
     update(["language"]);
  }


  _initData() {
    update(["language"]);
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
