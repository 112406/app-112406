import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryListPage extends GetView<HistoryListController> {
  const HistoryListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HistoryListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryListController>(
      init: HistoryListController(),
      id: "history_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
