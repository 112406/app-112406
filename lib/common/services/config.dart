import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

/// 配置服務
class ConfigService extends GetxService {
  // 這是一個單例寫法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  // 主題模式
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 是否首次打開
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadyOpen);

  // 切换 theme
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppTheme.dark : AppTheme.light,
    );
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? "dark" : "light");
  }

  // 初始 theme
  void initTheme() {
    var themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themeCode == "dark" ? true : false;
    Get.changeTheme(
      themeCode == "dark" ? AppTheme.dark : AppTheme.light,
    );
  }

  // 當前系統語言
  Locale locale = PlatformDispatcher.instance.locale;

  // 初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // 標記已打開app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }

  @override
  void onReady() {
    super.onReady();

    initLocale();
  }
}
