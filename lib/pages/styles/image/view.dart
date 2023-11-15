import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class ImagePage extends GetView<ImageController> {
  const ImagePage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return ListView(
      children: const [
        // ListTile(
        //   leading: ImageWidget.url(
        //       "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-450x450.jpg"),
        //   title: TextWidget.body1("ImageWidget.url"),
        // ),
        ListTile(
          leading: ImageWidget.asset(AssetsImages.hikingPng),
          title: TextWidget.textmd("ImageWidget.asset"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(
      init: ImageController(),
      id: "image",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("image")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
