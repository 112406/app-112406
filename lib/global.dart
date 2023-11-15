import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/utils/loading.dart';
import 'package:healthcare_app/firebase_options.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 初始化服務
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => Get.put<AuthService>(AuthService()));

    // 工具類
    await Storage().init();
    await DBHelper.initDb();
    Loading();

    // 初始化服務
    Get.put<UserService>(UserService());
    Get.put<ConfigService>(ConfigService());
  }
}
