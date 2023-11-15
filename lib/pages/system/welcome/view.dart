import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  // slider
  // Widget _buildSlider() {
  //   return GetBuilder<WelcomeController>(
  //     id: "slider",
  //     init: controller,
  //     builder: (controller) => controller.items == null
  //         ? const SizedBox()
  //         : WelcomeSliderWidget(
  //             controller.items!,
  //             onPageChanged: (index) {},
  //           ),
  //   );
  // }

  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder: (controller) => controller.items == null
          ? const SizedBox()
          : WelcomeSliderWidget(
              controller.items!,
              onPageChanged: (index) {},
            ),
    );
  }

  // 內容頁
  Widget _buildView() {
    return _buildSlider();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return _buildView();
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<WelcomeController>(
  //     init: WelcomeController(),
  //     id: "welcome",
  //     builder: (_) {
  //       return Scaffold(
  //         // appBar: AppBar(title: const Text("welcome")),
  //         body: PageView.builder(
  //           scrollDirection: Axis.vertical,
  //           itemCount: 3,
  //           itemBuilder: (_, index) {
  //             return Container(
  //               width: double.maxFinite,
  //               height: double.maxFinite,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage(images[index]),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               child: Container(
  //                 margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
  //                 child: Row(
  //                   children: [
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: const [
  //                         TextWidget.headingsm("text"),
  //                         TextWidget.paragraphmd("text"),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}
