import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

/// 主題
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2F5F9),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    colorScheme: lightColorScheme,
    fontFamily: "Jakarta",
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    colorScheme: darkColorScheme,
    fontFamily: "Jakarta",
  );
}
