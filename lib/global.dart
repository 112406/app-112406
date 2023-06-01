import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 工具類
    await Storage().init();
    Loading();

    // 初始化服務
    Get.put<ConfigService>(ConfigService());
    Get.put<WPHttpService>(WPHttpService());
    Get.put<UserService>(UserService());

    // 系統樣式
    setSystemUi();
  }

  // 系統樣式
  static void setSystemUi() {
    if (GetPlatform.isMobile) {
      // 屏幕方向 豎直上
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      // 透明狀態欄
      // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent, // transparent status bar
      // ));
    }

    if (GetPlatform.isAndroid) {
      // 去除頂部系統下拉和底部系統按鍵
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      // 去掉底部系統按鍵
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //     overlays: [SystemUiOverlay.bottom]);

      // 自定義樣式
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        // 頂部狀態欄顏色
        statusBarColor: Colors.transparent,
        // 該屬性僅用於 iOS 設備頂部狀態欄亮度
        // statusBarBrightness: Brightness.light,
        // 頂部狀態欄圖標的亮度
        // statusBarIconBrightness: Brightness.light,

        // 底部狀態欄與主內容分割線顏色
        systemNavigationBarDividerColor: Colors.transparent,
        // 底部狀態欄顏色
        systemNavigationBarColor: Colors.white,
        // 底部狀態欄圖標樣式
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
