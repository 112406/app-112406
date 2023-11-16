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
      titleTextStyle: TextStyle(
        color: Color(0xFF1B1B1F),
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    ),
    colorScheme: lightColorScheme,
    fontFamily: "Jakarta",
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF090E1D),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    ),
    colorScheme: darkColorScheme,
    fontFamily: "Jakarta",
  );
}
