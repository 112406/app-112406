import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryDetailsPage extends GetView<HistoryDetailsController> {
  const HistoryDetailsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HistoryDetailsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDetailsController>(
      init: HistoryDetailsController(),
      id: "history_details",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history_details")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
