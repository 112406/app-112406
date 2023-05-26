import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fitness/common/index.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const ImageWidget.asset(
      AssetsImages.splash1Jpg,
      fit: BoxFit.fill, // 填充整个界面
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
