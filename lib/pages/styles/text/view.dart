import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healthcare_app/common/index.dart';
import 'index.dart';

class TextPage extends GetView<TextController> {
  const TextPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return ListView(
      children: const [
        ListTile(title: TextWidget.heading2xl("heading2xl")),
        ListTile(title: TextWidget.displaylg("displaylg")),
        ListTile(title: TextWidget.label2XL("label2XL")),
        ListTile(title: TextWidget.headingmd("headingmd")),
        ListTile(title: TextWidget.text2xl("text2xl")),
        ListTile(title: TextWidget.paragraphxl("paragraphxl")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextController>(
      init: TextController(),
      id: "text",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("text")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
