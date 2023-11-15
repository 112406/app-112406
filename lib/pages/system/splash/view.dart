import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    backgroundColor(AppColors.gray100);
    return Container(
      alignment: Alignment.center,
      color: AppColors.gray100,
      child: Image.asset(
        AssetsImages.darklogomarkPng,
        width: 512,
        height: 512,
        fit: BoxFit.cover,
        // colorblendMode: BlendMode.srcIn,
      ),
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
