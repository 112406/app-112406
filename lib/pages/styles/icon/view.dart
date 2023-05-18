import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class IconPage extends GetView<IconController> {
  const IconPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return ListView(
      children: [
        ListTile(
          leading: IconWidget.icon(Icons.home),
          title: const TextWidget.body1("IconWidget.icon"),
        ),
        ListTile(
          leading: IconWidget.image(AssetsImages.accessTimePng),
          title: const TextWidget.body1("IconWidget.accessTimePng"),
        ),
        ListTile(
          leading: IconWidget.svg(AssetsSvgs.cancelSvg),
          title: const TextWidget.body1("IconWidget.cancelSvg"),
        ),
        ListTile(
          leading: IconWidget.url(
              "https://ducafecat.oss-cn-beijing.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/categories/c-man.png"),
          title: const TextWidget.body1("IconWidget.url"),
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
