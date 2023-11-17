import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import '../../index.dart';
import 'index.dart';

class WellnessContentPage extends GetView<WellnessContentController> {
  const WellnessContentPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: controller.newsContent.length,
        itemBuilder: (BuildContext context, int index) {
          // print(index);
          return _newsContentItem(context, controller.newsContent[index]);
        },
      ),
    );
  }

  Widget _newsContentItem(BuildContext context, NewsContentModel news) {
    if (news.paragraph != null && controller.i == 0) {
      controller.i++;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          news.paragraph!,
          style: const TextStyle(fontSize: 18),
          softWrap: true,
        ),
      );
      // return Card(
      //   child: Row(
      //     children: [
      //       Container(
      //         width: 10,
      //         color: Colors.green,
      //       ),
      //       const VerticalDivider(
      //         color: Colors.green,
      //         thickness: 10,
      //         width: 10,
      //       ),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.9,
      //         child: Text(
      //           news.paragraph!,
      //           style: const TextStyle(fontSize: 18),
      //           softWrap: true,
      //         ),
      //       )
      //     ],
      //   ),
      // );
    } else if (news.title != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          news.title!,
          style: const TextStyle(
              fontSize: 26,
              color: Color(0xFF3a7a36),
              fontWeight: FontWeight.bold),
          softWrap: true,
        ),
      );
    } else if (news.paragraph != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          news.paragraph!,
          style: const TextStyle(fontSize: 18),
          softWrap: true,
        ),
      );
    } else if (news.urlToImage != null) {
      return Image.network(news.urlToImage!);
    }
    return const Text('');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WellnessContentController>(
      init: WellnessContentController(),
      id: "wellness_content",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.wellnessNewsTitle.tr),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: controller.newsContent.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _buildView(),
          ),
        );
      },
    );
  }
}
