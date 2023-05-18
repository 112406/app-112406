import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      title: 'Flutter Demo',
      // 主題
      theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

      // 系統語言
      translations: Translation(), // 辭典
      localizationsDelegates: Translation.localizationsDelegates, // 代理
      supportedLocales: Translation.supportedLocales, // 支援的語系
      locale: ConfigService.to.locale, // 當前語言種類
      fallbackLocale: Translation.fallbackLocale, // 當前語言種類

      // 路由
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
