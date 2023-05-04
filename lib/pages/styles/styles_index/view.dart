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
