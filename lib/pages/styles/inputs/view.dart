import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({Key? key}) : super(key: key);

  // 主视图
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
        IconWidget.svg(
          AssetsDuotoneSvgs.genderMaleSvg57,
        ),
        hintText: "圖標/文本/填充/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 後綴圖標/文本/填充/邊框
      InputWidget.suffixTextFilled(
        IconWidget.svg(
          AssetsDuotoneSvgs.genderMaleSvg57,
        ),
        hintText: "後綴圖標/文本/填充/邊框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 搜索
      InputWidget.search(
        hintText: "搜索",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 圖標/文本/填充/後綴
      InputWidget.iconAndTextFilledSuffix(
        IconWidget.svg(
          AssetsMonotoneSvgs.keySvg38,
          color: AppColors.white,
        ),
        IconWidget.svg(
          AssetsSolidSvgs.eyeSvg37,
          color: AppColors.gray70,
        ),
      ).width(300)
      // .paddingBottom(AppSpace.listRow),

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
