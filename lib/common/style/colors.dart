import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

/// 應用顏色
class AppColors {
  /// *******************************************
  /// 自定義 顏色
  /// *******************************************
  ///
  // static Color info = Get.isDarkMode
  //     ? const Color.fromARGB(255, 187, 33, 243)
  //     : const Color(0xFF2196F3);
  // static Color success = const Color(0xFF4CAF50);
  // static Color warning = const Color(0xFFFFC107);
  // static Color danger = const Color(0xFFF44336);

  /// 顏色表
  static Color blue10 = const Color(0xFFEDF5FF);
  static Color blue20 = const Color(0xFFD0E4FF);
  static Color blue30 = const Color(0xFFA6CBFF);
  static Color blue40 = const Color(0xFF78AEFF);
  static Color blue50 = const Color(0xFF458CFF);
  static Color blue60 = const Color(0xFF0F67FE);
  static Color blue70 = const Color(0xFF0048CE);
  static Color blue80 = const Color(0xFF00349C);
  static Color blue90 = const Color(0xFF00206C);
  static Color blue100 = const Color(0xFF001141);

  static Color teal10 = const Color(0xFFD9FBFB);
  static Color teal20 = const Color(0xFF9EEFF0);
  static Color teal30 = const Color(0xFF3DD6DB);
  static Color teal40 = const Color(0xFF08BDBA);
  static Color teal50 = const Color(0xFF00939D);
  static Color teal60 = const Color(0xFF00737D);
  static Color teal70 = const Color(0xFF00545D);
  static Color teal80 = const Color(0xFF003C44);
  static Color teal90 = const Color(0xFF022A30);
  static Color teal100 = const Color(0xFF081A1C);

  static Color cyan10 = const Color(0xFFE5F6FF);
  static Color cyan20 = const Color(0xFFBAE6FF);
  static Color cyan30 = const Color(0xFF82CFFF);
  static Color cyan40 = const Color(0xFF33B1FF);
  static Color cyan50 = const Color(0xFF1192E8);
  static Color cyan60 = const Color(0xFF0072C3);
  static Color cyan70 = const Color(0xFF00539A);
  static Color cyan80 = const Color(0xFF003A6D);
  static Color cyan90 = const Color(0xFF012749);
  static Color cyan100 = const Color(0xFF061727);

  static Color red10 = const Color(0xFFFFF1F3);
  static Color red20 = const Color(0xFFFFD7DD);
  static Color red30 = const Color(0xFFFFB3BD);
  static Color red40 = const Color(0xFFFF8391);
  static Color red50 = const Color(0xFFFA4D5E);
  static Color red60 = const Color(0xFFDA1E2E);
  static Color red70 = const Color(0xFFA21922);
  static Color red80 = const Color(0xFF750E13);
  static Color red90 = const Color(0xFF520407);
  static Color red100 = const Color(0xFF2D0708);

  static Color purple10 = const Color(0xFFF6F2FF);
  static Color purple20 = const Color(0xFFE8DAFF);
  static Color purple30 = const Color(0xFFD4BBFF);
  static Color purple40 = const Color(0xFFBE95FF);
  static Color purple50 = const Color(0xFFBE95FF);
  static Color purple60 = const Color(0xFF8A3FFC);
  static Color purple70 = const Color(0xFF6929C4);
  static Color purple80 = const Color(0xFF491D8B);
  static Color purple90 = const Color(0xFF31135E);
  static Color purple100 = const Color(0xFF1C0F30);

  static Color gray10 = const Color(0xFFF2F5F9);
  static Color gray20 = const Color(0xFFDCE1E8);
  static Color gray30 = const Color(0xFFBEC5D2);
  static Color gray40 = const Color(0xFF9EA7B8);
  static Color gray50 = const Color(0xFF818BA0);
  static Color gray60 = const Color(0xFF5D6A85);
  static Color gray70 = const Color(0xFF3D4966);
  static Color gray80 = const Color(0xFF242E49);
  static Color gray90 = const Color(0xFF141B31);
  static Color gray100 = const Color(0xFF090E1D);

  static Color white = const Color(0xFFFFFFFF);

  /// 產品
  static ExtWooColorTheme get woo => Get.theme.extension<ExtWooColorTheme>()!;
  static Color get highlight =>
      Get.theme.extension<ExtWooColorTheme>()!.highlight!;

  /// 基礎色
  static ExtBaseColorTheme get base =>
      Get.theme.extension<ExtBaseColorTheme>()!;
  static Color get info => Get.theme.extension<ExtBaseColorTheme>()!.info!;
  static Color get success =>
      Get.theme.extension<ExtBaseColorTheme>()!.success!;
  static Color get warning =>
      Get.theme.extension<ExtBaseColorTheme>()!.warning!;

  /// Success
  /// Warning
  /// Danger
  /// Info

  /// *******************************************
  /// Material System
  /// *******************************************

  static Color get background => Get.theme.colorScheme.background;

  static Brightness get brightness => Get.theme.colorScheme.brightness;

  static Color get error => Get.theme.colorScheme.error;

  static Color get errorContainer => Get.theme.colorScheme.errorContainer;

  static Color get inversePrimary => Get.theme.colorScheme.inversePrimary;

  static Color get inverseSurface => Get.theme.colorScheme.inverseSurface;

  static Color get onBackground => Get.theme.colorScheme.onBackground;

  static Color get onError => Get.theme.colorScheme.onError;

  static Color get onErrorContainer => Get.theme.colorScheme.onErrorContainer;

  static Color get onInverseSurface => Get.theme.colorScheme.onInverseSurface;

  static Color get onPrimary => Get.theme.colorScheme.onPrimary;

  static Color get onPrimaryContainer =>
      Get.theme.colorScheme.onPrimaryContainer;

  static Color get onSecondary => Get.theme.colorScheme.onSecondary;

  static Color get onSecondaryContainer =>
      Get.theme.colorScheme.onSecondaryContainer;

  static Color get onSurface => Get.theme.colorScheme.onSurface;

  static Color get onSurfaceVariant => Get.theme.colorScheme.onSurfaceVariant;

  static Color get onTertiary => Get.theme.colorScheme.onTertiary;

  static Color get onTertiaryContainer =>
      Get.theme.colorScheme.onTertiaryContainer;

  static Color get outline => Get.theme.colorScheme.outline;

  static Color get primary => Get.theme.colorScheme.primary;

  static Color get primaryContainer => Get.theme.colorScheme.primaryContainer;

  static Color get secondary => Get.theme.colorScheme.secondary;

  static Color get secondaryContainer =>
      Get.theme.colorScheme.secondaryContainer;

  static Color get shadow => Get.theme.colorScheme.shadow;

  static Color get surface => Get.theme.colorScheme.surface;

  static Color get surfaceVariant => Get.theme.colorScheme.surfaceVariant;

  static Color get tertiary => Get.theme.colorScheme.tertiary;

  static Color get tertiaryContainer => Get.theme.colorScheme.tertiaryContainer;
}
