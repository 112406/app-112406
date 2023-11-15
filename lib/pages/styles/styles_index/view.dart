import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "語言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      ),
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主題 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
      // 文本
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),

      // Icon 圖標
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesIcon),
        title: const TextWidget.paragraphmd("Icon 圖標"),
      ),

      // Image 圖片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const TextWidget.paragraphmd("Image 圖片"),
      ),
      // Button 按鈕
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesButtons),
        title: const TextWidget.paragraphmd("Button 按鈕"),
      ),
      // Input 輸入框
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesInputs),
        title: const TextWidget.paragraphmd("Input 輸入框"),
      ),
      // form 表單
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesTextForm),
        title: const TextWidget.paragraphmd("form 表单"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("styles_index")),
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
