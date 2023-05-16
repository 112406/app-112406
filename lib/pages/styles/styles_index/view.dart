import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主題 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "語言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      ),
      // 文本
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
      // Icon 圖標
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesIcon),
        title: const TextWidget.body1("Icon 圖標"),
      ),
      // Image 圖片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const TextWidget.body1("Image 圖片"),
      ),
      // Button 按鈕
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesButtons),
        title: const TextWidget.body1("Button 按鈕"),
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
          appBar: AppBar(title: const Text("styles_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
