import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import '../../index.dart';
import 'index.dart';

class WellnessIndexPage extends GetView<WellnessIndexController> {
  const WellnessIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return ListView.builder(
      itemCount: controller.newsCover.length,
      itemBuilder: (BuildContext context, int index) {
        // print(index);
        return _newsItem(context, controller.newsCover[index]);
      },
    );
  }

  Widget _newsItem(BuildContext context, NewsCoverModel news) {
    return Card(
      color: AppColors.primaryContainer,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.wellnessWellnessContent, arguments: news.url);
        },
        child: Column(
          children: [
            Image.network(news.urlToImage!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    news.title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(news.description!),
                  Text(news.publishedAt!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WellnessIndexController>(
      init: WellnessIndexController(),
      id: "wellness_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.wellnessNewsTitle.tr)),
          body: SafeArea(
            child: controller.newsCover.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _buildView(),
          ),
        );
      },
    );
  }
}
