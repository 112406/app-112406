import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AchievementIndexPage extends GetView<AchievementIndexController> {
  const AchievementIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("AchievementIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AchievementIndexController>(
      init: AchievementIndexController(),
      id: "achievement_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("achievement_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
