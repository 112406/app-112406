import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class ButtonsPage extends GetView<ButtonsController> {
  const ButtonsPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ).paddingAll(AppSpace.card),
    );
  }

  Widget _buildButtons() {
    return <Widget>[
      // primary 主按鈕
      ButtonWidget.primary(
        "主按鈕",
        onTap: () {},
      ).paddingBottom(AppSpace.listRow),

      // secondary 次按鈕
      ButtonWidget.secondary(
        "次按鈕",
        onTap: () {},
      ).paddingBottom(AppSpace.listRow),

      // 文字按鈕
      ButtonWidget.text(
        "文字按鈕",
        textSize: 15,
        onTap: () {},
        // onTap: () async {
        //   await ConfigService.to.switchThemeModel();
        //   controller.update(["buttons"]);
        // },
      ).paddingBottom(AppSpace.listRow),

      // 圖標按鈕
      ButtonWidget.icon(
        IconWidget.svg(
          // AssetsSvgs.cHomeSvg,
          AssetsImages.cancelPng,
          size: 30,
        ),
        onTap: () {},
      ).tightSize(30).paddingBottom(AppSpace.listRow),

      // 文字/填充 按鈕
      ButtonWidget.textFilled(
        "15",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
        textSize: 12,
        onTap: () {},
      ).paddingBottom(AppSpace.listRow),

      // 文字/填充/圓形 按鈕
      ButtonWidget.textRoundFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: 12,
        textSize: 9,
        onTap: () {},
      ).tight(width: 24, height: 24).paddingBottom(AppSpace.listRow),

      // // iconTextUpDown, // 圖標/文字/上下
      // ButtonWidget.iconTextUpDown(
      //   IconWidget.svg(
      //     AssetsSvgs.cHomeSvg,
      //     size: 30,
      //   ),
      //   "Home",
      //   onTap: () {},
      // ).paddingBottom(AppSpace.listRow),

      // // iconTextOutlined, // 圖標/文字/邊框
      // ButtonWidget.iconTextOutlined(
      //   IconWidget.svg(
      //     AssetsSvgs.cHomeSvg,
      //     size: 30,
      //   ),
      //   "Home",
      //   onTap: () {},
      // )
      //     .tight(
      //       width: 100,
      //       height: 50,
      //     )
      //     .paddingBottom(AppSpace.listRow),

      // // iconTextUpDownOutlined, // 圖標/文字/上下/邊框
      // ButtonWidget.iconTextUpDownOutlined(
      //   IconWidget.svg(
      //     AssetsSvgs.cHomeSvg,
      //     size: 30,
      //   ),
      //   "Home",
      //   onTap: () {},
      // )
      //     .tight(
      //       width: 100,
      //       height: 50,
      //     )
      //     .paddingBottom(AppSpace.listRow),

      // // textIcon, // 文字/圖標
      // ButtonWidget.textIcon(
      //   "Home",
      //   IconWidget.svg(
      //     AssetsSvgs.cHomeSvg,
      //     size: 30,
      //   ),
      //   onTap: () {},
      // ).paddingBottom(AppSpace.listRow),

      //
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
      init: ButtonsController(),
      id: "buttons",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("buttons")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
