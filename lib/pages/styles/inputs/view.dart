import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildInputs().center(),
    );
  }

  Widget _buildInputs() {
    return <Widget>[
      /// 文本
      const InputWidget.text(
        hintText: "文本",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 文本/邊框
      const InputWidget.textBorder(
        hintText: "文本/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 文本/填充/邊框
      InputWidget.textFilled(
        hintText: "文本/填充/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 圖標/文本/填充/邊框
      InputWidget.iconTextFilled(
        IconWidget.image(
          AssetsImages.searchButtonPng,
        ),
        hintText: "圖標/文本/填充/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 後綴圖標/文本/填充/邊框
      InputWidget.suffixTextFilled(
        IconWidget.image(
          AssetsImages.searchButtonPng,
        ),
        hintText: "後綴圖標/文本/填充/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 搜尋
      InputWidget.search(
        hintText: "搜尋",
      ).width(300).paddingBottom(AppSpace.listRow),

      // end
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("inputs")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
