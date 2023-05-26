import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:project_fitness/common/index.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896), // 設計稿中設備的尺寸(單位隨意,建議dp,但在使用過程中必須保持一致)
        splitScreenMode: false, // 支持分屏尺寸
        minTextAdapt: false, // 是否根據寬度/高度中的最小值適配文字
        // 一般返回一個material app類型的function()
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            // 主題
            theme:
                ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

            // 系統語言
            translations: Translation(), // 辭典
            localizationsDelegates: Translation.localizationsDelegates, // 代理
            supportedLocales: Translation.supportedLocales, // 支援的語系
            locale: ConfigService.to.locale, // 當前語言種類
            fallbackLocale: Translation.fallbackLocale, // 當前語言種類

            // 路由
            initialRoute: RouteNames.systemSplash,
            // initialRoute: RouteNames.stylesStylesIndex,
            getPages: RoutePages.list,
            navigatorObservers: [RoutePages.observer],

            // builder
            builder: (context, widget) {
              widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

              // 不隨系統字體縮放比例
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },

            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}
