import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SportsIndexPage extends GetView<SportsIndexController> {
  const SportsIndexPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView() {
    return const Center(
      child: Text("SportsIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SportsIndexController>(
      init: SportsIndexController(),
      id: "sports_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("sports_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
