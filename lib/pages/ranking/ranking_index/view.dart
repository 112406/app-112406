import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RankingIndexPage extends GetView<RankingIndexController> {
  const RankingIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("RankingIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankingIndexController>(
      init: RankingIndexController(),
      id: "ranking_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("ranking_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
