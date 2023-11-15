import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 提示框
class Loading {
  static const int _milliseconds = 500; // 提示 延遲毫秒, 提示體驗 秒關太快
  static const int _dismissMilliseconds = 2000; // dismiss 延遲毫秒

  Loading() {
    EasyLoading.instance
      ..displayDuration =
          const Duration(milliseconds: _dismissMilliseconds) // 關閉延遲
      ..indicatorType = EasyLoadingIndicatorType.ring // 指示器類型
      ..loadingStyle = EasyLoadingStyle.custom // Loading樣式 自定義
      ..indicatorSize = 35.0 // 指示器大小
      ..lineWidth = 2 // 進度條寬度
      ..radius = 10.0 // 圓角
      ..progressColor = Colors.white // 進度條顏色
      ..backgroundColor = Colors.black.withOpacity(0.7) // 背景顏色
      ..indicatorColor = Colors.white // 指示器顏色
      ..textColor = Colors.white // 文字顏色
      ..maskColor = Colors.black.withOpacity(0.6) // 遮罩顏色
      ..userInteractions = true // 用戶交互
      ..dismissOnTap = false; // 點擊關閉
  }

  // 顯示
  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? 'Loading...');
  }

  // 錯誤
  static void error([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showError(text ?? 'Error'),
    );
  }

  // 成功
  static void success([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showSuccess(text ?? 'Success'),
    );
  }

  // toast
  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  // 關閉
  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
      () {
        EasyLoading.instance.userInteractions = true; // 恢復交互操作
        EasyLoading.dismiss();
      },
    );
  }
}
