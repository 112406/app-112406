import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HeartAnalysisPage extends GetView<HeartAnalysisController> {
  const HeartAnalysisPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HeartAnalysisPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeartAnalysisController>(
      init: HeartAnalysisController(),
      id: "heart_analysis",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("heart_analysis")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
