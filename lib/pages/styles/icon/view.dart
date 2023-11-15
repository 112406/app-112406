import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class IconPage extends GetView<IconController> {
  const IconPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return ListView(
      children: [
        ListTile(
          leading: IconWidget.icon(Icons.home),
          title: const TextWidget.paragraphmd("IconWidget.icon"),
        ),
        ListTile(
          leading: IconWidget.image(AssetsImages.defaultPng),
          title: const TextWidget.paragraphmd("IconWidget.image"),
        ),
        ListTile(
          leading: IconWidget.svg(AssetsDuotoneSvgs.activityHikingSvg80),
          title: const TextWidget.paragraphmd("IconWidget.svg"),
        ),
        ListTile(
          leading: IconWidget.url(
              "https://ducafecat-pub.oss-cn-qingdao.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/categories/c-man.png"),
          title: const TextWidget.paragraphmd("IconWidget.url"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IconController>(
      init: IconController(),
      id: "icon",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("icon")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
