import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

/// 主題
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark, // appBar 暗色 , 和主題色相反
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light, // appBar 亮色 , 和主題色相反
    ),
  );
}
